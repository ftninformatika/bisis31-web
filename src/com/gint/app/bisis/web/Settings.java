package com.gint.app.bisis.web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.util.PropertyResourceBundle;
import java.util.ResourceBundle;

public class Settings {
  
  public static Settings getSettings() {
    return instance;
  }
  
  private Settings() {
  }
  
  public Connection getConn() {
    return conn;
  }
  public String getLocale() {
    return locale;
  }
  public String getStaticFilter() {
    return staticFilter;
  }
  private Connection conn;
  private String locale;
  private String staticFilter;
  
  private static Settings instance = new Settings();
  
  static {
    ResourceBundle rb = PropertyResourceBundle.getBundle(
        "com.gint.app.bisis.web.Settings");
    String driver     = rb.getString("driver");
    String URL        = rb.getString("url");
    String username   = rb.getString("username");
    String password   = rb.getString("password");
    instance.locale   = rb.getString("locale");
    try {
      instance.staticFilter = rb.getString("staticFilter");
    } catch (Exception ex) {
      instance.staticFilter = null;
    }
    try {
      Class.forName(driver);
      instance.conn = DriverManager.getConnection(URL, username, password);
    } catch (Exception ex) {
      ex.printStackTrace();
    }
  }
}
