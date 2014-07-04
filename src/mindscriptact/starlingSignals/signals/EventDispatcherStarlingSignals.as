package mindscriptact.starlingSignals.signals {
import flash.utils.Dictionary;

import mindscriptact.signalsExpress.SignalExpress;
import mindscriptact.starlingSignals.NativeSignalStarlingExpress;

import starling.events.EventDispatcher;

public class EventDispatcherStarlingSignals {

	protected var target:EventDispatcher;

	public function EventDispatcherStarlingSignals(target:EventDispatcher) {
		this.target = target;
	}

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
	protected function getNativeSignal(eventType:String, eventClass:Class = null):NativeSignalStarlingExpress {
		CONFIG::debug {
			if (eventType == null || eventType == "") {
				throw new ArgumentError("eventType should not be empty:'" + eventType + "'.");
			}
		}
		return _signals[eventType] ||= new NativeSignalStarlingExpress(target, eventType, eventClass);
	}

	/**
	 * Creates signal for event type, and adds listener function to handle it.
	 * @param type        event type to create signal for.
	 * @param handler    handler function to be added from signal.
	 */
	public function addEventSignalHandler(type:String, handler:Function):void {
		var signal:NativeSignalStarlingExpress = getNativeSignal(type);
		//
		signal.add(handler);
	}

	/**
	 * Gets signal for event type, and removes handler function from it.
	 * @param type        event type for signal.
	 * @param handler    handler function to be removed from signal.
	 */
	public function removeEventSignalHandler(type:String, handler:Function):void {
		var signal:NativeSignalStarlingExpress = getNativeSignal(type);
		//
		signal.remove(handler);
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
