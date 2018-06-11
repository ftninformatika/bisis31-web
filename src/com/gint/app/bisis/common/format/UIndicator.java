package com.gint.app.bisis.common.format;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Class UIndicator comment.
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class UIndicator implements Serializable {
  
  /**
   * Default constructor does nothing. 
   */
  public UIndicator() {
  }

  /**
   * @param description Indicator description.
   */
  public UIndicator(String description) {
    this.description = description;
  }
  
  /**
   * @param description Indicator description.
   * @param defaultValue Default value.
   */
  public UIndicator(String description, String defaultValue) {
    this.description = description;
    this.defaultValue = defaultValue;
  }

  /**
   * @return Returns the defaultValue.
   */
  public String getDefaultValue() {
    return defaultValue;
  }
  /**
   * @param defaultValue The defaultValue to set.
   */
  public void setDefaultValue(String defaultValue) {
    this.defaultValue = defaultValue;
  }
  /**
   * @return Returns the description.
   */
  public String getDescription() {
    return description;
  }
  /**
   * @param description The description to set.
   */
  public void setDescription(String description) {
    this.description = description;
  }
  /**
   * @return Returns the values.
   */
  public List getValues() {
    return values;
  }
  /**
   * @param values The values to set.
   */
  public void setValues(List values) {
    this.values = values;
  }
  /**
   * Adds an indicator value.
   * 
   * @param item Value item to be added.
   */
  public void addValue(UItem item) {
    values.add(item);
  }
  /**
   * Removes an indicator value.
   * 
   * @param item Value item to be removed.
   */
  public void removeValue(UItem item) {
    values.remove(item);
  }
  /**
   * Retrieves a value item by its code.
   * 
   * @param code The code of the requested value item.
   * @return The requested value item; null if not found.
   */
  public UItem getValue(String code) {
    UItem retVal = null;
    for (int i = 0; i < values.size(); i++) {
      UItem item = (UItem)values.get(i);
      if (item.getCode().equals(code)) {
        retVal = item;
        break;
      }
    }
    return retVal;
  }

  /** Indicator description. */
  private String description;
  /** Default value. */
  private String defaultValue;
  /** The list of possible values, as a list of <code>UItem</code>s. */
  private List values = new ArrayList();
}
