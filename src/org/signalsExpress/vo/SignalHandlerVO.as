// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package org.signalsExpress.vo {

/**
 * Value object for handler data.
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SignalHandlerVO {
	
	public var handler:Function;
	public var once:Boolean;
	
	public var next:SignalHandlerVO;
	public var prev:SignalHandlerVO;

}
}