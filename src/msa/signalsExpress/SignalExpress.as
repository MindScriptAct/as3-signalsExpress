// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package msa.signalsExpress {
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

/**
 * Alternative to flash events. Re-imagination of as3-Signals (Robert Penner)
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SignalExpress {
	
	// optional collection of classes, that dispatcher, must provide.
	private var innerParamClasses:Array;
	
	// all handlerVO's stored by function.
	private var handlerRegistry:Dictionary = new Dictionary();
	
	// first handler in linked list
	private var head:SignalHandlerVO;
	
	// last handler in linked list
	private var tail:SignalHandlerVO;
	
	/**
	 * CONSTRUCTOR
	 * @param	... paramClasses	optional classes that must be dispatched and handled by listening function.
	 */
	public function SignalExpress(... paramClasses) {
		CONFIG::debug {
			if (paramClasses) {
				var paramCount:int = paramClasses.length;
				for (var i:int; i < paramCount; i++) {
					if (!(paramClasses[i] is Class)) {
						throw new ArgumentError("Invalid paramClasses item type at index " + i + " should be a Class but was:<" + paramClasses[i] + ">." + getQualifiedClassName(paramClasses[i]));
					}
				}
			}
		}
		innerParamClasses = paramClasses;
	}
	
	/**
	 * Alternative way to constructor parameters to set paramClasses that must be dispatched and handled by listening function.
	 */
	public function set paramClasses(value:Array):void {
		CONFIG::debug {
			if (value) {
				var paramCount:int = value.length;
				for (var i:int; i < paramCount; i++) {
					if (!(value[i] is Class)) {
						throw new ArgumentError("Invalid value item type at index " + i + " should be a Class but was:<" + value[i] + ">." + getQualifiedClassName(value[i]));
					}
				}
			}
		}
		innerParamClasses = value;
	}
	
	//----------------------------------
	//     adding
	//----------------------------------
	
	/**
	 * Add handler function, that will be executed every time signal is dispatched.
	 * @param	handler	function to be executed with every signal dispatch.
	 * @param	once	if set to true - handler will be automatically removed after first use.
	 */
	public function add(handler:Function, once:Boolean = false):void {
		
		// check if handler is already added
		if (handlerRegistry[handler]) {
			throw Error("This handler is already added.");
		}
		
		// create handler object
		var handlerVo:SignalHandlerVO = new SignalHandlerVO();
		handlerVo.handler = handler;
		handlerVo.once = once;
		
		handlerRegistry[handler] = handlerVo;
		
		// add to linked list.
		
		if (head) {
			tail.next = handlerVo;
			handlerVo.prev = tail;
			tail = handlerVo;
		} else {
			head = handlerVo;
			tail = handlerVo;
		}
	
	}
	
	//----------------------------------
	//     removing
	//----------------------------------
	
	/**
	 * Remove signal handling function.
	 * @param	handler	remove function to be not executed with  signal dispatch.
	 */
	public function remove(handler:Function):void {
		var handlerVo:SignalHandlerVO = handlerRegistry[handler];
		if (handlerVo) {
			
			// remove from list.
			if (handlerVo.prev) {
				handlerVo.prev.next = handlerVo.next;
			} else {
				// the first
				head = handlerVo.next;
			}
			if (handlerVo.next) {
				handlerVo.next.prev = handlerVo.prev;
			} else {
				// the last
				tail = handlerVo.prev;
			}
			
			// remove from registry.
			delete handlerRegistry[handler];
		}
	}
	
	/**
	 * Remove all signal handling functions.
	 */
	public function removeAll():void {
		
		var handlerVo:SignalHandlerVO = head;
		
		while (handlerVo) {
			var nextHandler:SignalHandlerVO = handlerVo.next;
			
			delete handlerRegistry[handlerVo.handler];
			
			handlerVo.handler = null;
			handlerVo.next = null;
			handlerVo.prev = null;
			
			handlerVo = nextHandler;
		}
		
		head = null;
		tail = null;
	}
	
	//----------------------------------
	//     dispatching
	//----------------------------------
	
	/**
	 * Dispatch signal, all handling functions will be executed with given parameters.
	 * @param	... params	Parameter objects to be sent to handling function.
	 */
	public function dispatch(... params):void {
		
		var paramCount:int = params.length;
		
		CONFIG::debug {
			
			var paramClassCount:int = innerParamClasses.length;
			
			// Cannot dispatch fewer objects than declared classes.
			if (paramCount < paramClassCount) {
				throw new ArgumentError("Incorrect number of arguments. " + "Expected at least " + paramClassCount + " but received " + paramCount + ".");
			}
			
			// Cannot dispatch differently typed objects than declared classes.
			for (var i:int = 0; i < paramClassCount; i++) {
				// Optimized for the optimistic case that values are correct.
				if (!(params[i] is innerParamClasses[i]) && params[i] !== null)
					throw new ArgumentError("Value object: <" + params[i] + ">, is not an instance of type:<" + innerParamClasses[i] + ">.");
			}
		}
		
		// start with the head.
		var handlerVo:SignalHandlerVO = head;
		
		while (handlerVo) {
			
			// execute handler.
			if (paramCount == 0) {
				handlerVo.handler();
			} else if (paramCount == 1) {
				handlerVo.handler(params[0]);
			} else if (paramCount == 2) {
				handlerVo.handler(params[0], params[1]);
			} else if (paramCount == 3) {
				handlerVo.handler(params[0], params[1], params[2]);
			} else if (paramCount == 4) {
				handlerVo.handler(params[0], params[1], params[2], params[3]);
			} else if (paramCount == 5) {
				handlerVo.handler(params[0], params[1], params[2], params[3], params[4]);
			} else if (paramCount == 6) {
				handlerVo.handler(params[0], params[1], params[2], params[3], params[4], params[5]);
			} else if (paramCount == 7) {
				handlerVo.handler(params[0], params[1], params[2], params[3], params[4], params[5], params[6]);
			} else if (paramCount == 8) {
				handlerVo.handler(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7]);
			} else if (paramCount == 9) {
				handlerVo.handler(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8]);
			} else if (paramCount == 10) {
				handlerVo.handler(params[0], params[1], params[2], params[3], params[4], params[5], params[6], params[7], params[8], params[9]);
			} else {
				handlerVo.handler.apply(null, params);
			}
			
			// next handler
			if (handlerVo.once) {
				var nextHandler:SignalHandlerVO = handlerVo.next;
				remove(handlerVo.handler);
				handlerVo = nextHandler;
			} else {
				handlerVo = handlerVo.next;
			}
			
		}
	}
	
	//----------------------------------
	//     bubbling
	//----------------------------------
	
	/**
	 * Make other signal dispatches dispatch current signal.
	 * @param	bubblingSignal	another signal for this signal to react to.
	 */
	public function addBubblingFrom(bubblingSignal:SignalExpress):void {
		bubblingSignal.add(this.dispatch);
	}
	
	/**
	 * Stop current signal from dispatching then another signal dispatches.
	 * @param	bubblingSignal	another signal for this signal to stop reacting to.
	 */
	public function removeBubblingFrom(bubblingSignal:SignalExpress):void {
		bubblingSignal.remove(this.dispatch);
	}

}
}

/**
 * Value object for handler data.
 */
class SignalHandlerVO {
	
	public var handler:Function;
	public var once:Boolean;
	
	public var next:SignalHandlerVO;
	public var prev:SignalHandlerVO;

}