package mindscriptact.flashSignals.signals.display {
import flash.display.Stage;
import flash.events.Event;
import flash.events.FullScreenEvent;

import mindscriptact.flashSignals.NativeSignalExpress;

public class StageSignals extends DisplayObjectSignals {

	public function StageSignals(target:Stage) {
		super(target);
	}

	public function get mouseLeave():NativeSignalExpress {return getNativeSignal(Event.MOUSE_LEAVE);}//[Event(name="mouseLeave",type="flash.events.Event")]

	public function get fullScreen():NativeSignalExpress {return getNativeSignal(FullScreenEvent.FULL_SCREEN, FullScreenEvent);}//[Event(name="fullScreen",type="flash.events.FullScreenEvent")]
	public function get resize():NativeSignalExpress {return getNativeSignal(Event.RESIZE);}//[Event(name="resize",type="flash.events.Event")]

}
}
