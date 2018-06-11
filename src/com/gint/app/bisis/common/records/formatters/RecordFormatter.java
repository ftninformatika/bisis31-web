package com.gint.app.bisis.common.records.formatters;

import java.util.HashMap;

import com.gint.app.bisis.common.records.Record;

/**
 * Represents a record formatter.
 *
 * @author mbranko@uns.ns.ac.yu
 */
public interface RecordFormatter {
  
  public String toASCII(Record record, String locale,int free,HashMap inventar);
  public String toHTML(Record record, String locale,int free, HashMap inventar);

}
