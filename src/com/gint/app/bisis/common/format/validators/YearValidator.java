package com.gint.app.bisis.common.format.validators;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.gint.app.bisis.common.format.UValidator;
import com.gint.app.bisis.common.format.UValidatorException;

/**
 * Class YearValidator comment.
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class YearValidator implements UValidator {

  public YearValidator() {
    targets = new ArrayList();
    targets.add("100c");
    targets.add("100d");
    targets.add("210d");
    targets.add("210h");
    targets.add("321b");
    targets.add("328d");
    targets.add("328e");
    targets.add("501k");
    targets.add("503i");
    targets.add("601f");
    targets.add("605k");
    targets.add("710f");
    targets.add("711f");
    targets.add("712f");
    targets.add("910f");
    targets.add("911f");
    targets.add("912f");
    targets.add("961f");
    targets.add("965k");
    log.info("Loading year validator");
  }
  
  public List getTargets() {
    return targets;
  }

  public String isValid(String content) {
    String retVal = "";
    try {
      validate(content);
    } catch (UValidatorException ex) {
      retVal = ex.getMessage();
    }
    return retVal;
  }

  public void validate(String content) throws UValidatorException {
    if (content.length() != 4)
      throw new UValidatorException("Godina mora imati \u010detiri cifre!\nNepoznatu godinu ozna\u010dite sa ???? umesto [b.g.] ili [s.a.]");
    for (int i = 0; i < 4; i++) {
      char cifra = content.charAt(i);
      if (!(Character.isDigit(cifra) || cifra == '?'))
        throw new UValidatorException(
            "Godinu mogu ozna\u010davati cifre i upitnik!");
    }
  }
  
  private List targets;
  private static Log log = LogFactory.getLog(YearValidator.class.getName());
}
