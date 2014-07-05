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

	/**
	 * Object is added.
	 * signal for starling.events::Event.ADDED
	 */
	public function get added():NativeSignalStarlingExpress {
		return getNativeSignal(Event.ADDED);
	}//[Event(name="added", type="starling.events.Event")]

	/**
	 * Object is removed.
	 * signal for starling.events::Event.REMOVED
	 */
	public function get removed():NativeSignalStarlingExpress {
		return getNativeSignal(Event.REMOVED);
	}//[Event(name="removed", type="starling.events.Event")]

	/**
	 * Object is added to stage
	 * signal for starling.events::Event.ADDED_TO_STAGE
	 */
	public function get addedToStage():NativeSignalStarlingExpress {
		return getNativeSignal(Event.ADDED_TO_STAGE);
	}//[Event(name="addedToStage", type="starling.events.Event")]

	/**
	 * Object is removed from stage
	 * signal for starling.events::Event.REMOVED_FROM_STAGE
	 */
	public function get removedFromStage():NativeSignalStarlingExpress {
		return getNativeSignal(Event.REMOVED_FROM_STAGE);
	}//[Event(name="removedFromStage", type="starling.events.Event")]

	/**
	 * Object goes to next frame.
	 * signal for starling.events::Event.ENTER_FRAME
	 */
	public function get enterFrame():NativeSignalStarlingExpress {
		return getNativeSignal(Event.ENTER_FRAME);
	}//[Event(name="enterFrame", type="starling.events.EnterFrameEvent")]

	/**
	 * Object is touched or interacted with mouse.
	 * signal for starling.events::TouchEvent.TOUCH
	 */
	public function get touch():NativeSignalStarlingExpress {
		return getNativeSignal(TouchEvent.TOUCH, TouchEvent);
	}//[Event(name="touch", type="starling.events.TouchEvent")]

	/**
	 * Keyboard key is pressed down.
	 * signal for starling.events::KeyboardEvent.KEY_DOWN
	 */
	public function get keyDown():NativeSignalStarlingExpress {
		return getNativeSignal(KeyboardEvent.KEY_DOWN, KeyboardEvent);
	}//[Event(name="keyDown", type="starling.events.KeyboardEvent")]

	/**
	 * Keyboard key is released up.
	 * signal for starling.events::KeyboardEvent.KEY_UP
	 */
	public function get keyUp():NativeSignalStarlingExpress {
		return getNativeSignal(KeyboardEvent.KEY_UP, KeyboardEvent);
	}//[Event(name="keyUp", type="starling.events.KeyboardEvent")]

}
}
