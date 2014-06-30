package mindscriptact.flashSignals {
import flash.events.Event;
import flash.events.IEventDispatcher;
import flash.utils.Dictionary;

import mindscriptact.signalsExpress.SignalExpress;

public class NativeSignalExpress extends SignalExpress {

	private var target:IEventDispatcher;
	private var eventType:String;

	private var eventHandlers:Dictionary = new Dictionary();

	public function NativeSignalExpress(target:IEventDispatcher, eventType:String, eventClass:Class = null) {
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

	/**
	 * Add handler with event parameters.
	 */
	public function addWithParameters(handler:Function, useOnce:Boolean = false, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
		target.addEventListener(eventType, handler, useCapture, priority, useWeakReference);
		if (useOnce) {
			var removeFunction:Function = function ():void {
				target.removeEventListener(eventType, handler);
			};
			target.addEventListener(eventType, removeFunction);
			eventHandlers[handler] = removeFunction;
		}
	}

	/**
	 * Remove handler with event parameters.
	 */
	public function removeWithParameters(handler:Function, useCapture:Boolean = false):void {
		target.removeEventListener(eventType, handler, useCapture);
		if (eventHandlers[handler]) {
			target.removeEventListener(eventType, eventHandlers[handler]);
			delete eventHandlers[handler];
		}
	}
}
}
