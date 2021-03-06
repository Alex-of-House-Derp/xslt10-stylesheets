package com.nwalsh.xalan;

import org.apache.xml.utils.DOMBuilder;
import com.nwalsh.xalan.Callout;

/**
 * <p>Utility class for the Verbatim extension (ignore this).</p>
 *
 * <p>Copyright (C) 2000, 2001 Norman Walsh.</p>
 *
 * <p><b>Change Log:</b></p>
 * <dl>
 * <dt>1.0</dt>
 * <dd><p>Initial release.</p></dd>
 * </dl>
 *
 * @author Norman Walsh
 * <a href="mailto:ndw@nwalsh.com">ndw@nwalsh.com</a>
 *
 * @see Verbatim
 **/

public class FormatTextCallout extends FormatCallout {
  public FormatTextCallout(boolean fo) {
    stylesheetFO = fo;
  }

  public void formatCallout(DOMBuilder rtf,
			    Callout callout) {
    formatTextCallout(rtf, callout);
  }
}
