package mindscriptact.flashSignals.display {
import flash.display.DisplayObject;
import flash.display.SimpleButton;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

import mindscriptact.flashSignals.signals.display.InteractiveObjectSignals;

public class SimpleButtonExpress extends SimpleButton {

	public function SimpleButtonExpress(upState:DisplayObject = null, overState:DisplayObject = null, downState:DisplayObject = null, hitTestState:DisplayObject = null) {
		super(upState, overState, downState, hitTestState);
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
	 * Remove all event listeners.
	 */
	public function removeAllEventListeners():void {
		_signals.removeAll();
	}

}
}
