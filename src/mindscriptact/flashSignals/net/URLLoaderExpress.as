package mindscriptact.flashSignals.net {
import flash.net.URLLoader;
import flash.net.URLRequest;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class URLLoaderExpress extends URLLoader {

	public function URLLoaderExpress(request:URLRequest = null) {
		super(request);
	}

	private var _signals:EventDispatcherSignals;

	public function get signals():EventDispatcherSignals {
		return _signals ||= new EventDispatcherSignals(this);
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
