// Licensed under the MIT license: http://www.opensource.org/licenses/mit-license.php
package mindscriptact.signalsExpress {
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;

/**
 * Alternative to flash events. Re-imagination of as3-Signals(by Robert Penner)
 * @author Raimundas Banevicius (http://www.mindscriptact.com/)
 */
public class SignalExpress {

	// for reuse.
	private const EMPTY_ARRAY:Array = [];

	// optional collection of classes, that dispatcher, must provide.
	private var innerParamClasses:Array;

	// all handlerVO's stored by function.
	private var handlerRegistry:Dictionary = new Dictionary();

	// first handler in linked list
	private var head:SignalHandlerVO;

	// last handler in linked list
	private var tail:SignalHandlerVO;

	private var _handlerCount:int;

	/**
	 * CONSTRUCTOR
	 * @param    ... paramClasses    classes that can be optionally provided to ensure that then dispatching parameters with provided types are dispatched. (you can pass more parameters, but not less.)
	 */
	public function SignalExpress(...paramClasses) {
		CONFIG::debug {
			if (paramClasses) {
				var paramCount:int = paramClasses.length;
				for (var i:int; i < paramCount; i++) {
					if (!(paramClasses[i] is Class)) {
						throw new ArgumentError("Only 'Class' type parameters can be provided. Wrong element at index:" + i + " type: " + getQualifiedClassName(paramClasses[i]));
					}
				}
			}
		}
		innerParamClasses = paramClasses;
	}

	/**
	 * Alternative way to set paramClasses that must be provided when signal is dispatched.
	 */
	public function set paramClasses(value:Array):void {
		if (value == null) {
			value = EMPTY_ARRAY;
		}
		CONFIG::debug {
			var paramCount:int = value.length;
			for (var i:int; i < paramCount; i++) {
				if (!(value[i] is Class)) {
					throw new ArgumentError("Only 'Class' type parameters can be provided. Wrong element at index:" + i + " type: " + getQualifiedClassName(value[i]));
				}
			}
		}
		innerParamClasses = value;
	}

	/**
	 * Gives minimum count of parameters that must be provided then dispatching.
	 */
	public function get paramCount():uint {
		return innerParamClasses.length;
	}

	/**
	 * Gives count of added signals handlers.
	 */
	public function get handlerCount():int {
		return _handlerCount;
	}

	//----------------------------------
	//     adding
	//----------------------------------

	/**
	 * Add handler function, that will be executed every time signal is dispatched.
	 * @param    handler    function to be executed with every signal dispatch.
	 * @param    useOnce    if set to true - handler will be automatically removed after first use.
	 */
	public function add(handler:Function, useOnce:Boolean = false):void {

		// check if handler is not already added
		if (handlerRegistry[handler] == null) {

			// create handler object
			var handlerVo:SignalHandlerVO = new SignalHandlerVO();
			handlerVo.handler = handler;
			handlerVo.useOnce = useOnce;

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

			_handlerCount++;
		}
	}

	//----------------------------------
	//     removing
	//----------------------------------

	/**
	 * Remove signal handling function.
	 * @param    handler    remove function to be not executed with signal dispatch.
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

			_handlerCount--;

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

		_handlerCount = 0;
	}

	/**
	 * Checks if handler function will be executed then signal dispatches.
	 * @param    handler    function to be executed with every signal dispatch.
	 */
	public function has(handler:Function):Boolean {
		return (handlerRegistry[handler] != null);
	}

	//----------------------------------
	//     dispatching
	//----------------------------------

	/**
	 * Dispatch signal, all handling functions will be executed with given parameters.
	 * @param    ... params    Parameter objects to be sent to handling function.
	 */
	public function dispatch(...params):void {

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
				if (!(params[i] is innerParamClasses[i]) && params[i] !== null) {
					throw new ArgumentError("Value object: <" + params[i] + ">, is not an instance of type:<" + innerParamClasses[i] + ">.");
				}
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
			if (handlerVo.useOnce) {
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
	 * Make other signal dispatches trigger current signal.
	 * @param    bubblingSignal    another signal for this signal to react to.
	 */
	public function addBubblingFrom(bubblingSignal:SignalExpress):void {
		bubblingSignal.add(this.dispatch);
	}

	/**
	 * Stop signal from dispatching when another signal dispatches.
	 * @param    bubblingSignal    another signal for this signal to stop reacting to.
	 */
	public function removeBubblingFrom(bubblingSignal:SignalExpress):void {
		bubblingSignal.remove(this.dispatch);
	}

	/**
	 * Checks if provided signal will trigger(bubble to) this signal.
	 * @param    bubblingSignal    another signal, that might bubble to current one.
	 */
	public function hasBubblingFrom(bubblingSignal:SignalExpress):Boolean {
		return bubblingSignal.has(this.dispatch);
	}

}
}

/**
 * INTERNAL. Value object for handler data.
 */
class SignalHandlerVO {

	public var handler:Function;
	public var useOnce:Boolean;

	public var next:SignalHandlerVO;
	public var prev:SignalHandlerVO;

}