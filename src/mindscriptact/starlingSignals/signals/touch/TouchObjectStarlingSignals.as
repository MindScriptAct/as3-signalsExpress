package mindscriptact.starlingSignals.signals.touch {
import mindscriptact.signalsExpress.SignalExpress;
import mindscriptact.starlingSignals.signals.display.DisplayObjectStarlingSignals;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class TouchObjectStarlingSignals extends DisplayObjectStarlingSignals {
	private var _clickTest:SignalExpress;
	private var touchHandlerAdded:Boolean;

	private var displayTarget:DisplayObject;

	public function TouchObjectStarlingSignals(target:DisplayObject) {
		displayTarget = target;
		super(target);
	}

	public function get click():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return getTouchSignal();
	}

	private function handleTouch(event:TouchEvent):void {
		//var touch:Vector.<Touch> = event.touches;
		var touch:Touch = event.getTouch(displayTarget);
		if (touch) {
			switch (touch.phase) {
				case TouchPhase.BEGAN:
					break;
				case TouchPhase.ENDED:
					if (_clickTest) {
						_clickTest.dispatch(event)
					}
					break;
				case TouchPhase.HOVER:
					break;
				case TouchPhase.MOVED:
					break;
				case TouchPhase.STATIONARY:
					break;
			}
		}
	}

	private function getTouchSignal():SignalExpress {
		return _clickTest ||= new SignalExpress();
	}
}
}
