package mindscriptact.flashSignals.display {
import flash.display.Bitmap;
import flash.display.BitmapData;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;
import mindscriptact.flashSignals.signals.display.DisplayObjectSignals;

public class BitmapExpress extends Bitmap {

	/** @inheritDoc */
	public function BitmapExpress(bitmapData:BitmapData = null, pixelSnapping:String = "auto", smoothing:Boolean = false) {
		super(bitmapData, pixelSnapping, smoothing);
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
