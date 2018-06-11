package com.gint.app.bisis.common.records.formatters;

import java.util.HashMap;

import com.gint.app.bisis.common.records.Record;
import com.gint.app.bisis.common.records.RecordFactory;

/**
 * Formats records in the full format.
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class FullFormatter implements RecordFormatter {

  public String toASCII(Record record, String locale,int free,HashMap inventar) {
    return RecordFactory.toFullFormat(0, record, false);
  }

  public String toHTML(Record record, String locale,int free,HashMap inventar) {
    return "<code>" + RecordFactory.toFullFormat(0, record, true) + "</code>";
  }

}
