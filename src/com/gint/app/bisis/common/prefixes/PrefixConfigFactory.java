package com.gint.app.bisis.common.prefixes;

import com.gint.app.bisis.common.prefixes.config.def.DefaultPrefixConfig;

/**
 * Produces PrefixMap objects according to the prefix.map system property.
 * 
 * @author mbranko@uns.ns.ac.yu
 */
public class PrefixConfigFactory {
  
  public static PrefixConfig getPrefixConfig() {
    return new DefaultPrefixConfig();
  }
}
