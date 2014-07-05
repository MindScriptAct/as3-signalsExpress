package mindscriptact.starlingSignals.display {
import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;
import mindscriptact.starlingSignals.signals.touch.TouchObjectStarlingSignals;

import starling.display.Image;
import starling.display.Quad;
import starling.textures.Texture;

public class QuadStarlingExpress extends Quad {

	/** @inheritDoc */
	public function QuadStarlingExpress(width:Number, height:Number, color:uint=0xffffff,
										premultipliedAlpha:Boolean=true) {
		super(width, height, color, premultipliedAlpha);
	}

	private var _signals:TouchObjectStarlingSignals;

	public function get signals():TouchObjectStarlingSignals {
		return _signals ||= new TouchObjectStarlingSignals(this);
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
