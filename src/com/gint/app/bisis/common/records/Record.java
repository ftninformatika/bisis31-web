package com.gint.app.bisis.common.records;

/**
 * Represents a UNIMARC record.
 * 
 * @author mbranko@uns.ns.ac.yu
 */
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class Record implements Serializable {

  /**
   * Default constructor.
   */
  public Record() {
    recordID = new RecordID();
    pubType = 0;
    fields = new ArrayList();
  }

  /**
   * Initializes the new record with the given record id.
   * @param recordID The record identifier.
   */
  public Record(RecordID recordID) {
    this.recordID = recordID;
    pubType = 0;
    fields = new ArrayList();
  }

  /**
   * Initializes the new record with the given record id and the list of fields.
   * @param recordID The given record identifier
   * @param fields The initial list of fields 
   */
  public Record(RecordID recordID, List fields) {
    this.recordID = recordID;
    pubType = 0;
    this.fields = fields;
  }

  /**
   * Returns the number of fields in this record.
   * @return The number of fields in this record
   */
  public int getFieldCount() {
    return fields.size();
  }
  
  /**
   * Retrieves a field by its current index in the field list.
   * @param index The index of the field
   * @return The field with the given index; null if index is out of range
   */
  public Field getField(int index) {
    if (index >= fields.size() || index < 0)
      return null;
    return (Field)fields.get(index);
  }
  
  /**
   * Retrives the first field with given name from this record.
   * @param name The field name
   * @return The first field with the given name
   */
  public Field getField(String name) {
    for (int i = 0; i < fields.size(); i++) {
      Field field = (Field)fields.get(i);
      if (field.getName().equals(name)) {
        return field;
      }
    }
    return null;
  }
  
  /**
   * Retrieves all fields with the given name from this record.
   * @param name The field name
   * @return The list of all fields with the given name
   */
  public List getFields(String name) {
    ArrayList retVal = new ArrayList();
    for (int i = 0; i < fields.size(); i++) {
      Field field = (Field)fields.get(i);
      if (field.getName().equals(name))
        retVal.add(field);
    }
    return retVal;
  }
  
  /**
   * Retrieves the first subfield of the first field with the given name.
   * @param name The name of the subfield
   * @return The retrieved subfield
   */
  public Subfield getSubfield(String name) {
    if (name.length() != 4)
      return null;
    String fieldName = name.substring(0, 3);
    Field f = getField(fieldName);
    if (f == null)
      return null;
    Subfield sf = f.getSubfield(name.charAt(3));
    return sf;
  }
  
  /**
   * Retrieves all subfields with the given name from this record.
   * @param name The name of the subfield
   * @return The list of retrieved subfields
   */
  public List getSubfields(String name) {
    List retVal = new ArrayList();
    if (name.length() != 4)
      return retVal;
    String fieldName = name.substring(0, 3);
    Iterator it1 = getFields(fieldName).iterator();
    while (it1.hasNext()) {
      Field f = (Field)it1.next();
      Iterator it2 = f.getSubfields(name.charAt(3)).iterator();
      while (it2.hasNext()) {
        retVal.add(it2.next());
      }
    }
    return retVal;
  }
  
  /**
   * Retrieves the content of the first subfield with the given name.
   * @param name The name of the first subfield
   * @return The content of the subfield
   */
  public String getSubfieldContent(String name) {
    Subfield sf = getSubfield(name);
    if (sf == null)
      return null;
    else
      return sf.getContent();
  }
  
  /**
   * Retrieves the list of contents of all subfields with the given name.
   * @param name The name of the subfield
   * @return The list of subfield contents
   */
  public List getSubfieldsContent(String name) {
    List retVal = new ArrayList();
    Iterator subfields = getSubfields(name).iterator();
    while (subfields.hasNext()) {
      Subfield sf = (Subfield)subfields.next();
      retVal.add(sf.getContent());
    }
    return retVal;
  }
  
  /**
   * Appends the given field to the end of the list.
   * @param field The field to append
   */
  public void add(Field field) {
    fields.add(field);
  }
  
  /**
   * Removes the given field from the list.
   * @param field The field to remove
   */
  public void remove(Field field) {
    fields.remove(field);
  }

  /**
   * Sorts the fields, subfields, and subsubfields in this record.
   */
  public void sort() {
    for (int i = 1; i < fields.size(); i++) {
      for (int j = 0; j < fields.size() - i; j++) {
        Field f1 = (Field)fields.get(j);
        Field f2 = (Field)fields.get(j+1);
        if (f1.getName().compareTo(f2.getName()) > 0) {
          fields.set(j, f2);
          fields.set(j+1, f1);
        }
      }
    }
    for (int i = 0; i < fields.size(); i++) {
      Field f = (Field)fields.get(i);
      f.sort();
    }
  }
  
  /**
   * Removes empty fields, subfields, and subsubfields from this record. 
   */
  public void pack() {
    Iterator it = fields.iterator();
    while (it.hasNext()) {
      Field f = (Field)it.next();
      f.pack();
      if (f.getSubfieldCount() == 0)
        it.remove();
    }
  }
  
  /**
   * Trims all subfield and subsubfield contents in this record. Returns this
   * record.
   * @return This record, with trimmed contents
   */
  public Record trim() {
    Iterator it = fields.iterator();
    while (it.hasNext()) {
      Field f = (Field)it.next();
      f.trim();
    }
    return this;
  }

  /**
   * Returns a printable string representation of this record.
   */
  public String toString() {
    StringBuffer retVal = new StringBuffer();
    for (int i = 0; i < fields.size(); i++) {
      retVal.append(fields.get(i).toString());
    }
    return retVal.toString();
  }

  /**
   * @return Returns the creationDate.
   */
  public Date getCreationDate() {
    return creationDate;
  }
  /**
   * @param creationDate The creationDate to set.
   */
  public void setCreationDate(Date creationDate) {
    this.creationDate = creationDate;
  }
  /**
   * @return Returns the creator.
   */
  public Author getCreator() {
    return creator;
  }
  /**
   * @param creator The creator to set.
   */
  public void setCreator(Author creator) {
    this.creator = creator;
  }
  /**
   * @return Returns the fields.
   */
  public List getFields() {
    return fields;
  }
  /**
   * @param fields The fields to set.
   */
  public void setFields(List fields) {
    this.fields = fields;
  }
  /**
   * @return Returns the lastModifiedDate.
   */
  public Date getLastModifiedDate() {
    return lastModifiedDate;
  }
  /**
   * @param lastModifiedDate The lastModifiedDate to set.
   */
  public void setLastModifiedDate(Date lastModifiedDate) {
    this.lastModifiedDate = lastModifiedDate;
  }
  /**
   * @return Returns the modifier.
   */
  public Author getModifier() {
    return modifier;
  }
  /**
   * @param modifier The modifier to set.
   */
  public void setModifier(Author modifier) {
    this.modifier = modifier;
  }
  /**
   * @return Returns the pubType.
   */
  public int getPubType() {
    return pubType;
  }
  /**
   * @param pubType The pubType to set.
   */
  public void setPubType(int pubType) {
    this.pubType = pubType;
  }
  /**
   * @return Returns the recordID.
   */
  public RecordID getRecordID() {
    return recordID;
  }
  /**
   * @param recordID The recordID to set.
   */
  public void setRecordID(RecordID recordID) {
    this.recordID = recordID;
  }
  /** record identifier */
  private RecordID recordID;
  /** publication type */
  private int pubType;
  /** the list of fields */
  private List fields;
  /** record creator */
  private Author creator;
  /** record modifier */
  private Author modifier;
  /** record creation date */
  private Date creationDate;
  /** last modification date */
  private Date lastModifiedDate;
}
