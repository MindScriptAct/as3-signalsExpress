package mindscriptact.flashSignals.display {
import flash.display.Shape;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;
import mindscriptact.flashSignals.signals.display.DisplayObjectSignals;

public class ShapeExpress extends Shape {

	public function ShapeExpress() {
		super();
	}

	private var _signals:DisplayObjectSignals;

	public function get signals():DisplayObjectSignals {
		return _signals ||= new DisplayObjectSignals(this);
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
