package org.signalsExpress {
import flash.utils.Dictionary;
import flash.utils.getQualifiedClassName;
import org.signalsExpress.vo.SignalHandlerVO;

/**
 * COMMENT
 * @author rBanevicius
 */
public class SignalExpress {
	
	private var innerParamClasses:Array;
	
	// doit : is weak reference dictionary needed here???
	private var handlerRegistry:Dictionary = new Dictionary();
	
	// first handrel in linked list
	private var head:SignalHandlerVO;
	
	// last handler in linked list
	private var tail:SignalHandlerVO;
	
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
			
			// remove from rogistry.
			delete handlerRegistry[handler];
		}
	}
	
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
	
	public function addBubblingFrom(bubblingSignal:SignalExpress):void {
		bubblingSignal.add(this.dispatch);
	}
	
	public function removeBubblingFrom(bubblingSignal:SignalExpress):void {
		bubblingSignal.remove(this.dispatch);
	}

}
}