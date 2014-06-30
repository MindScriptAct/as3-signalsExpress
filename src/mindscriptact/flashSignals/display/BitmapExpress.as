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