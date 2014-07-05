package mindscriptact.starlingSignals.display {
import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;
import mindscriptact.starlingSignals.signals.display.StageStarlingSignals;

import starling.display.Stage;

public class StageStarlingExpress extends Stage {

	/** @inheritDoc */
	public function StageStarlingExpress(width:int, height:int, color:uint = 0) {
		super(width, height, color);
	}

	private var _signals:StageStarlingSignals;

	public function get signals():StageStarlingSignals {
		return _signals ||= new StageStarlingSignals(this);
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
