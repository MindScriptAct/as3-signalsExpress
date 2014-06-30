package mindscriptact.flashSignals.signals {
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.Dictionary;

import mindscriptact.flashSignals.NativeSignalExpress;
import mindscriptact.signalsExpress.SignalExpress;

public class EventDispatcherSignals {

	protected var target:IEventDispatcher;

	public function EventDispatcherSignals(target:IEventDispatcher) {
		this.target = target;
	}

	public function get activate():NativeSignalExpress { return getNativeSignal(Event.ACTIVATE);	}//[Event(name="activate",type="flash.events.Event")]
	public function get deactivate():NativeSignalExpress { return getNativeSignal(Event.DEACTIVATE);	}//[Event(name="deactivate",type="flash.events.Event")]

	//---------------
	// INTERNAL
	//---------------

	/* All signals by event type */
	private var _signals:Dictionary = new Dictionary(); //* of SignalExpress by String */

	/**
	 * Gets signal to handle event type.
	 * @param eventType        Event type to handle.
	 * @param eventClass    Optional event class to pass to signal as constructor parameter. (Helps debugging.)
	 * @return    SignalExpress object that will dispatch then event is dispatched.
	 */
	protected function getNativeSignal(eventType:String, eventClass:Class = null):NativeSignalExpress {
		CONFIG::debug {
			if (eventType == null || eventType == "") {
				throw new ArgumentError("eventType should not be empty:'" + eventType + "'.");
			}
		}
		return _signals[eventType] ||= new NativeSignalExpress(target, eventType, eventClass);
	}

	/**
	 * Creates signal for event type, and adds listener function to handle it.
	 * @param type        event type to create signal for.
	 * @param handler    handler function to be added from signal.
	 */
	public function addEventSignalHandler(type:String, handler:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
		var signal:NativeSignalExpress = getNativeSignal(type);
		//
		signal.addWithParameters(handler, false, useCapture, priority, useWeakReference);
	}

	/**
	 * Gets signal for event type, and removes handler function from it.
	 * @param type        event type for signal.
	 * @param handler    handler function to be removed from signal.
	 */
	public function removeEventSignalHandler(type:String, handler:Function, useCapture:Boolean = false):void {
		var signal:NativeSignalExpress = getNativeSignal(type);
		//
		signal.removeWithParameters(handler, useCapture);
	}

	/**
	 * Remove all handlers for all signals.
	 */
	public function removeAll():void {
		for each (var signal:SignalExpress in _signals) {
			signal.removeAll();
		}
	}

	/**
	 * The current number of listeners for all the signals.
	 * WARNING: can be slow if you have large amount of signals.
	 */
	public function get totalHandlerCount():int {
		var count:int = 0;
		for each (var signal:SignalExpress in _signals) {
			count += signal.handlerCount;
		}
		return count;
	}

}
}
