package mindscriptact.starlingSignals.signals.display {

import mindscriptact.starlingSignals.NativeSignalStarlingExpress;
import mindscriptact.starlingSignals.signals.EventDispatcherStarlingSignals;

import starling.display.DisplayObject;
import starling.events.Event;
import starling.events.KeyboardEvent;
import starling.events.TouchEvent;

public class DisplayObjectStarlingSignals extends EventDispatcherStarlingSignals {

	public function DisplayObjectStarlingSignals(target:DisplayObject) {
		super(target);
	}


	public function get added():NativeSignalStarlingExpress {return getNativeSignal(Event.ADDED);}//[Event(name="added", type="starling.events.Event")]
	public function get removed():NativeSignalStarlingExpress {return getNativeSignal(Event.REMOVED);}//[Event(name="removed", type="starling.events.Event")]

	public function get addedToStage():NativeSignalStarlingExpress {return getNativeSignal(Event.ADDED_TO_STAGE);}//[Event(name="addedToStage", type="starling.events.Event")]
	public function get removedFromStage():NativeSignalStarlingExpress {return getNativeSignal(Event.REMOVED_FROM_STAGE);}//[Event(name="removedFromStage", type="starling.events.Event")]

	public function get enterFrame():NativeSignalStarlingExpress {return getNativeSignal(Event.ENTER_FRAME);}//[Event(name="enterFrame", type="starling.events.EnterFrameEvent")]

	public function get touch():NativeSignalStarlingExpress {return getNativeSignal(TouchEvent.TOUCH, TouchEvent);}//[Event(name="touch", type="starling.events.TouchEvent")]

	public function get keyUp():NativeSignalStarlingExpress {return getNativeSignal(KeyboardEvent.KEY_UP, KeyboardEvent);}//[Event(name="keyUp", type="starling.events.KeyboardEvent")]
	public function get keyDown():NativeSignalStarlingExpress {return getNativeSignal(KeyboardEvent.KEY_DOWN, KeyboardEvent);}//[Event(name="keyDown", type="starling.events.KeyboardEvent")]

}
}
