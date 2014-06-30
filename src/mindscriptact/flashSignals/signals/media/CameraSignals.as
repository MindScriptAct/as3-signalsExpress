package mindscriptact.flashSignals.signals.media {
import flash.events.ActivityEvent;
import flash.events.StatusEvent;
import flash.media.Camera;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class CameraSignals extends EventDispatcherSignals {

	public function CameraSignals(target:Camera) {
		super(target);
	}

	public function get status():NativeSignalExpress {return getNativeSignal(StatusEvent.STATUS, StatusEvent);}//[Event(name="status",type="flash.events.StatusEvent")]
	public function get activity():NativeSignalExpress {return getNativeSignal(ActivityEvent.ACTIVITY, ActivityEvent);}//[Event(name="activity",type="flash.events.ActivityEvent")]

}
}
