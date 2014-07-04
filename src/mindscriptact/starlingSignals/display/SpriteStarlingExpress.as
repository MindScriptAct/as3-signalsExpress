package mindscriptact.starlingSignals.display {
import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;
import mindscriptact.starlingSignals.signals.display.SpriteStarlingSignals;

import starling.display.Sprite;

public class SpriteStarlingExpress extends Sprite {

	/** @inheritDoc */
	public function SpriteStarlingExpress() {
		super();
	}

	private var _signals:SpriteStarlingSignals;

	public function get signals():SpriteStarlingSignals {
		return _signals ||= new SpriteStarlingSignals(this);
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
