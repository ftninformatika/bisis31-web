package com.gint.app.bisis.common.records.serializers;

import com.gint.app.bisis.common.records.Record;


public interface RecordListener {
  public void handleRecord(Record rec);
}
