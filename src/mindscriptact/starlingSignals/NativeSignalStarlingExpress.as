package mindscriptact.starlingSignals {
import flash.utils.Dictionary;

import mindscriptact.signalsExpress.SignalExpress;

import starling.events.Event;
import starling.events.EventDispatcher;

public class NativeSignalStarlingExpress extends SignalExpress {

	private var target:EventDispatcher;
	private var eventType:String;

	private var eventHandlers:Dictionary = new Dictionary();

	public function NativeSignalStarlingExpress(target:EventDispatcher, eventType:String, eventClass:Class = null) {
		super(eventClass || Event);
		this.target = target;
		this.eventType = eventType;
	}

	/** @inheritDoc */
	override public function add(handler:Function, useOnce:Boolean = false):void {
		target.addEventListener(eventType, handler);
		if (useOnce) {
			var removeFunction:Function = function ():void {
				target.removeEventListener(eventType, handler);
			};
			target.addEventListener(eventType, removeFunction);
			eventHandlers[handler] = removeFunction;
		}
	}

	/** @inheritDoc */
	override public function remove(handler:Function):void {
		target.removeEventListener(eventType, handler);
		if (eventHandlers[handler]) {
			target.removeEventListener(eventType, eventHandlers[handler]);
			delete eventHandlers[handler];
		}
	}

	/** @inheritDoc */
	override public function removeAll():void {
		super.removeAll();
		for each(var removeHandler:Function in eventHandlers) {
			target.removeEventListener(eventType, removeHandler);
			eventHandlers = new Dictionary();
		}
	}


}
}
