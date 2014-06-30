package mindscriptact.flashSignals.signals.display {
import flash.display.DisplayObject;
import flash.events.Event;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class DisplayObjectSignals extends EventDispatcherSignals {

	public function DisplayObjectSignals(target:DisplayObject) {
		super(target);
	}

	public function get added():NativeSignalExpress {return getNativeSignal(Event.ADDED);}//[Event(name="added",type="flash.events.Event")]
	public function get removed():NativeSignalExpress {return getNativeSignal(Event.REMOVED);}//[Event(name="removed",type="flash.events.Event")]

	public function get addedToStage():NativeSignalExpress {return getNativeSignal(Event.ADDED_TO_STAGE);}//[Event(name="addedToStage",type="flash.events.Event")]
	public function get removedFromStage():NativeSignalExpress {return getNativeSignal(Event.REMOVED_FROM_STAGE);}//[Event(name="removedFromStage",type="flash.events.Event")]

	public function get frameConstructed():NativeSignalExpress {return getNativeSignal(Event.FRAME_CONSTRUCTED);}//[Event(name="frameConstructed",type="flash.events.Event")]
	public function get enterFrame():NativeSignalExpress {return getNativeSignal(Event.ENTER_FRAME);}//[Event(name="enterFrame",type="flash.events.Event")]
	public function get exitFrame():NativeSignalExpress {return getNativeSignal(Event.EXIT_FRAME);}//[Event(name="exitFrame",type="flash.events.Event")]

	public function get render():NativeSignalExpress {return getNativeSignal(Event.RENDER);}//[Event(name="render",type="flash.events.Event")]

}
}
