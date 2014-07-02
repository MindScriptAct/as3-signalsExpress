package mindscriptact.flashSignals.media {
import flash.media.Video;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

import mindscriptact.flashSignals.signals.display.DisplayObjectSignals;

public class VideoExpress extends Video {

	public function VideoExpress(width:int = 320, height:int = 240) {
		super(width, height);
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
