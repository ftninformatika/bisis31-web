package com.gint.app.bisis.common.records.serializers;

import java.util.Iterator;

import com.gint.app.bisis.common.format.PubTypes;
import com.gint.app.bisis.common.records.Field;
import com.gint.app.bisis.common.records.Record;
import com.gint.app.bisis.common.records.Subfield;
import com.gint.util.string.Signature;
import com.gint.util.string.StringUtils;

/**
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class IsisSerializer {

  public static String toISISFormat(Record record) {
    StringBuffer buff = new StringBuffer(1024);
    buff.append("! ID ");
    buff.append(StringUtils.padChars(Integer.toString(
        record.getRecordID().getLocalID()), '0', 6));
    buff.append('\n');
    Iterator it = record.getFields().iterator();
    while (it.hasNext()) {
      Field f = (Field)it.next();
      if (PubTypes.getFormat().containsSecondaryFields(f.getName()))
        continue;
      buff.append("!v");
      buff.append(f.getName());
      buff.append('!');
      Iterator it2 = f.getSubfields().iterator(); 
      while (it2.hasNext()) {
        Subfield sf = (Subfield)it2.next();
        buff.append('^');
        buff.append(sf.getName());
        if ((f.getName().equals("996") || f.getName().equals("997")) && sf.getName() == 'd')
          buff.append(Signature.userDisplay(sf.getContent()));
        else
          buff.append(sf.getContent());
      }
      buff.append('\n');
    }
    return buff.toString();
  }
  
}
