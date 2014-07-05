package mindscriptact.starlingSignals.display {

import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;
import mindscriptact.starlingSignals.signals.display.MovieClipStarlingSignals;

import starling.display.MovieClip;
import starling.textures.Texture;

public class MovieClipStarlingExpress extends MovieClip {

	/** @inheritDoc */
	public function MovieClipStarlingExpress(textures:Vector.<Texture>, fps:Number = 12) {
		super(textures, fps);
	}

	private var _signals:MovieClipStarlingSignals;

	public function get signals():MovieClipStarlingSignals {
		return _signals ||= new MovieClipStarlingSignals(this);
	}

	//-------------------

	public function get doubleClickEnabled():Boolean {
		return signals.doubleClickEnabled;
	}

	public function set doubleClickEnabled(value:Boolean):void {
		signals.doubleClickEnabled = value;
	}

	//-------------------

	public function setExtendedSignalSet(signalSetClass:Class):void {
		if (_signals) {
			throw Error("Signals are already being used. Please use setExtendedSignalSet() before using signals.");
		}
		_signals = new signalSetClass(this);
		if (!(_signals is EventDispatcherStarlingSignals)) {
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
