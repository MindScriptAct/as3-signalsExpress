package mindscriptact.starlingSignals.display {
import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;
import mindscriptact.starlingSignals.signals.display.ButtonStarlingSignals;

import starling.display.Sprite;
import starling.textures.Texture;

public class ButtonStarlingExpress extends starling.display.Button {

	/** @inheritDoc */
	public function ButtonStarlingExpress(upState:Texture, text:String = "", downState:Texture = null, overState:Texture = null, disabledState:Texture = null) {
		super(upState, text, downState, overState, disabledState);
	}

	private var _signals:ButtonStarlingSignals;

	public function get signals():ButtonStarlingSignals {
		return _signals ||= new ButtonStarlingSignals(this);
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
