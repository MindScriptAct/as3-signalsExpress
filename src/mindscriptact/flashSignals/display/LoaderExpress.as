package mindscriptact.flashSignals.display {
import flash.display.Loader;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

import mindscriptact.flashSignals.signals.display.InteractiveObjectSignals;

public class LoaderExpress extends Loader {

	public function LoaderExpress() {
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
	 * Remove all event listeners.
	 */
	public function removeAllEventListeners():void {
		_signals.removeAll();
	}


}
}
