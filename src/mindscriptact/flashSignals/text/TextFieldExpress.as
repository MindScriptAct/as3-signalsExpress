package mindscriptact.flashSignals.text {
import flash.text.TextField;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

import mindscriptact.flashSignals.signals.display.InteractiveObjectSignals;

public class TextFieldExpress extends TextField {

	public function TextFieldExpress() {
		super();
	}

	private var _signals:InteractiveObjectSignals;

	public function get signals():InteractiveObjectSignals {
		return _signals ||= new InteractiveObjectSignals(this);
	}

	//-------------------

	public function setExtendedSignalSet(signalSetClass:Class):void {
		if (_signals) {
			throw Error("Signals are already being used. Please use setExtendedSignalSet() before using signals.");
		}
		_signals = new signalSetClass(this);
		if (!(_signals is EventDispatcherSignals)) {
			throw Error(signalSetClass + " must be extended from  EventDispatcherSignals class.");
		}
	}

	/**
	 * Adds event handler thought signals.
	 */
	override public function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false):void {
		_signals.addEventSignalHandler(type, listener, useCapture, priority, useWeakReference);
	}

	/**
	 * Remove event handler thought signals.
	 */
	override public function removeEventListener(type:String, listener:Function, useCapture:Boolean = false):void {
		_signals.removeEventSignalHandler(type, listener);
	}

	/**
	 * Remove all event listeners.
	 */
	public function removeAllEventListeners():void {
		_signals.removeAll();
	}


}
}
