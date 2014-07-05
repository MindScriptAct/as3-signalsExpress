package mindscriptact.starlingSignals.text {
import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;
import mindscriptact.starlingSignals.signals.touch.TouchObjectStarlingSignals;

import starling.text.TextField;

public class TextFieldStarlingExpress extends TextField {

	/** @inheritDoc */
	public function TextFieldStarlingExpress(width:int, height:int, text:String, fontName:String = "Verdana", fontSize:Number = 12, color:uint = 0x0, bold:Boolean = false) {
		super(width, height, text, fontName, fontSize, color, bold);
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
