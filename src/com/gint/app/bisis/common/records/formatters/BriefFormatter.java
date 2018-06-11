package com.gint.app.bisis.common.records.formatters;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import com.gint.app.bisis.common.records.Field;
import com.gint.app.bisis.common.records.Record;
import com.gint.app.bisis.common.records.Subfield;
import com.gint.app.bisis.report.Report;

/**
 * Formats records in the brief format.
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class BriefFormatter implements RecordFormatter {
  
  public BriefFormatter() {
    etal = new HashMap();
    etal.put("sr", " i dr");
    etal.put("en", " et al");
    etal.put("hu", " et al");
  }
  
  public String toASCII(Record rec, String locale,int free,HashMap inventar) {
    StringBuffer retVal = new StringBuffer();
    retVal.append(getAuthor(rec, locale));
    if (retVal.length() > 0)
      retVal.append(". ");
    retVal.append(getTitle(rec));
    retVal.append(". ");
    String pub = getPublisher(rec);
    if (pub.length() > 0) {
      retVal.append(pub);
      retVal.append(", ");
    }
    String place = getPlace(rec);
    if (place.length() > 0) {
      retVal.append(place);
      retVal.append(", ");
    }
    String year = getYear(rec);
    if (year.length() > 0) {
      retVal.append(year);
      retVal.append(".");
    }
    String invNums = getInvNums(rec);
    if (invNums.length() > 0) {
      retVal.append("\n  inv: ");
      retVal.append(invNums);
    }
    return retVal.toString();
  }
  
  public String toHTML(Record rec, String locale,int free,HashMap inventar) {
    return Report.makeOne(free,rec,"-webSkraceno",locale,inventar);
  }
  
  private StringBuffer getAuthor(Record rec, String locale) {
    StringBuffer retVal = new StringBuffer();
    List f700 = rec.getFields("700");
    if (f700.size() > 0) {
      Field f1 = (Field)f700.get(0);
      if (f1.getInd2() == '1') {
        Subfield sfa = f1.getSubfield('a');
        Subfield sfb = f1.getSubfield('b');
        if (sfb != null)
          retVal.append(sfb.getContent());
        if (sfa != null) {
          if (retVal.length() > 0)
            retVal.append(' ');
          retVal.append(sfa.getContent());
        }
      } else {
        Subfield sfa = f1.getSubfield('a');
        if (sfa != null)
          retVal.append(sfa.getContent());
      }
      if (f700.size() > 1) {
        appendEtAl(retVal, locale);
        return retVal;
      }
    }
    List f701 = rec.getFields("701");
    if (f701.size() > 0) {
      if (retVal.length() > 0) {
        appendEtAl(retVal, locale);
        return retVal;
      }
      Field f1 = (Field)f701.get(0);
      if (f1.getInd2() == '1') {
        Subfield sfa = f1.getSubfield('a');
        Subfield sfb = f1.getSubfield('b');
        if (sfb != null)
          retVal.append(sfb.getContent());
        if (sfa != null) {
          if (retVal.length() > 0)
            retVal.append(' ');
          retVal.append(sfa.getContent());
        }
      } else {
        Subfield sfa = f1.getSubfield('a');
        if (sfa != null)
          retVal.append(sfa.getContent());
      }
      if (f701.size() > 1) {
        appendEtAl(retVal, locale);
        return retVal;
      }
    }
    List f702 = rec.getFields("702");
    if (f702.size() > 0) {
      if (retVal.length() > 0) {
        appendEtAl(retVal, locale);
        return retVal;
      }
      Field f1 = (Field)f702.get(0);
      if (f1.getInd2() == '1') {
        Subfield sfa = f1.getSubfield('a');
        Subfield sfb = f1.getSubfield('b');
        if (sfb != null)
          retVal.append(sfb.getContent());
        if (sfa != null) {
          if (retVal.length() > 0)
            retVal.append(' ');
          retVal.append(sfa.getContent());
        }
      } else {
        Subfield sfa = f1.getSubfield('a');
        if (sfa != null)
          retVal.append(sfa.getContent());
      }
      if (f702.size() > 1) {
        appendEtAl(retVal, locale);
        return retVal;
      }
    }
    return retVal;
  }
  
  private String getTitle(Record rec) {
    Field f200 = rec.getField("200");
    if (f200 != null) {
      Subfield sfa = f200.getSubfield('a');
      if (sfa != null)
        return sfa.getContent();
    }
    return "";
  }
  
  private String getPublisher(Record rec) {
    Field f210 = rec.getField("210");
    if (f210 != null) {
      Subfield sfc = f210.getSubfield('c');
      if (sfc != null)
        return sfc.getContent();
    }
    return "";
  }
  
  private String getYear(Record rec) {
    Field f100 = rec.getField("100");
    if (f100 != null) {
      Subfield sfc = f100.getSubfield('c');
      if (sfc != null)
        return sfc.getContent();
    }
    return "";
  }

  private String getPlace(Record rec) {
    Field f210 = rec.getField("210");
    if (f210 != null) {
      Subfield sfa = f210.getSubfield('a');
      if (sfa != null)
        return sfa.getContent();
    }
    return "";
  }
  
  private String getInvNums(Record rec) {
    StringBuffer sb = new StringBuffer();
    Iterator it = rec.getSubfields("996f").iterator();
    while (it.hasNext()) {
      Subfield sf = (Subfield)it.next();
      if (sf.getContent().equals(""))
        continue;
      if (sb.length() > 0)
        sb.append(", ");
      sb.append(sf.getContent());
    }
    it = rec.getSubfields("997f").iterator();
    while (it.hasNext()) {
      Subfield sf = (Subfield)it.next();
      if (sf.getContent().equals(""))
        continue;
      if (sb.length() > 0)
        sb.append(", ");
      sb.append(sf.getContent());
    }
    return sb.toString();
  }

  private void appendEtAl(StringBuffer sb, String locale) {
    String i_dr = (String)etal.get(locale);
    if (i_dr != null)
      sb.append(i_dr);
  }

  private HashMap etal;
}
