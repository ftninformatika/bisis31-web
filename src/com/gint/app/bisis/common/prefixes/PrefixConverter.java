package com.gint.app.bisis.common.prefixes;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.gint.app.bisis.common.records.Field;
import com.gint.app.bisis.common.records.Record;
import com.gint.app.bisis.common.records.Subfield;

/**
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class PrefixConverter {
  
  public static List toPrefixes(Record rec) {
    List retVal = new ArrayList();
    for (int i = 0; i < rec.getFieldCount(); i++) {
      Field field = rec.getField(i);
      fieldToPrefixes(retVal, field);
    }
    return retVal;
  }
  
  public static List getPrefixValues(Record rec, String prefName) {
    List retVal = toPrefixes(rec);
    Iterator it = retVal.iterator();
    while (it.hasNext()) {
      PrefixValue pv = (PrefixValue)it.next();
      if (!pv.prefName.equals(prefName))
        it.remove();
    }
    return retVal;
  }
  
  private static void fieldToPrefixes(List dest, Field field) {
    if (field.getName().startsWith("70") || field.getName().startsWith("90")){
      String au = prefixHandler.createAuthor(field);
      if (!au.equals(""))
        dest.add(new PrefixValue("AU", au));
    }
    for (int i = 0; i < field.getSubfieldCount(); i++) {
      Subfield subfield = field.getSubfield(i);
      if (subfield.getSecField() != null) {
        fieldToPrefixes(dest, subfield.getSecField());
      } else if (subfield.getSubsubfieldCount() > 0) {
        String content = prefixHandler.concatenateSubsubfields(subfield);
        if (!content.equals("")) {
          List prefList = prefixMap.getPrefixes(
              field.getName()+subfield.getName());
          if (prefList != null) {
            Iterator it = prefList.iterator();
            while (it.hasNext()) {
              String prefName = (String)it.next();
              dest.add(new PrefixValue(prefName, content));
            }
          }
        }
      } else {
        List prefList = (List)prefixMap.getPrefixes(
            field.getName()+subfield.getName());
        if (prefList != null) {
          Iterator it = prefList.iterator();
          while (it.hasNext()) {
            String prefName = (String)it.next();
            if (prefName.equals("AU"))
              continue;
            if (!subfield.getContent().equals(""))
              dest.add(new PrefixValue(prefName, subfield.getContent()));
          }
        }
      }
    }
  }
  
  static PrefixConfig prefixConfig;
  static PrefixHandler prefixHandler;
  static PrefixMap prefixMap;
  
  static {
    try {
      prefixConfig = PrefixConfigFactory.getPrefixConfig();
      prefixHandler = prefixConfig.getPrefixHandler();
      prefixMap = prefixConfig.getPrefixMap();
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }
}
