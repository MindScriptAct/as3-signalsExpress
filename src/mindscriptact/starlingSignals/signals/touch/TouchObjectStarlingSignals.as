package mindscriptact.starlingSignals.signals.touch {
import flash.utils.getTimer;

import mindscriptact.signalsExpress.SignalExpress;
import mindscriptact.starlingSignals.signals.display.DisplayObjectStarlingSignals;

import starling.display.DisplayObject;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class TouchObjectStarlingSignals extends DisplayObjectStarlingSignals {


	private var displayTarget:DisplayObject;

	private var touchHandlerAdded:Boolean;
	private var isMouseOver:Boolean;

	private const DOUBLE_CLICK_TIME:int = 500;
	public var doubleClickEnabled:Boolean;
	private var lastClick:int;

	private var _clickSignal:SignalExpress;
	private var _doubleClickSignal:SignalExpress;
	private var _mouseDownSignal:SignalExpress;
	private var _mouseUpSignal:SignalExpress;
	private var _mouseOverSignal:SignalExpress;
	private var _mouseOutSignal:SignalExpress;
	private var _mouseMoveSignal:SignalExpress;

	public function TouchObjectStarlingSignals(target:DisplayObject) {
		displayTarget = target;
		super(target);
	}

	/** signal for TouchEvent.TOUCH, TouchPhase.ENDED */
	public function get click():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _clickSignal ||= new SignalExpress();
	}

	/** signal for TouchEvent.TOUCH, TouchPhase.ENDED
	 * doubleClickEnabled must be set to true.
	 * Double click will dispatch,  if second click occurs during 500 ms after first click.
	 */
	public function get doubleClick():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _doubleClickSignal ||= new SignalExpress();
	}


	/** signal for TouchEvent.TOUCH, TouchPhase.BEGAN */
	public function get mouseDown():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _mouseDownSignal ||= new SignalExpress();
	}


	/** signal for TouchEvent.TOUCH, TouchPhase.ENDED */
	public function get mouseUp():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _mouseUpSignal ||= new SignalExpress();
	}


	/** signal for TouchEvent.TOUCH, TouchPhase.HOVER (first hover event) */
	public function get mouseOver():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _mouseOverSignal ||= new SignalExpress();
	}


	/** signal for TouchEvent.TOUCH, touchPhase == null (after last hover event) */
	public function get mouseOut():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _mouseOutSignal ||= new SignalExpress();
	}


	/** signal for TouchEvent.TOUCH, TouchPhase.HOVER and TouchPhase.MOVED */
	public function get mouseMove():SignalExpress {
		if (!touchHandlerAdded) {
			touchHandlerAdded = true;
			target.addEventListener(TouchEvent.TOUCH, handleTouch);
		}
		return _mouseMoveSignal ||= new SignalExpress();
	}

	private function handleTouch(event:TouchEvent):void {
		var touch:Touch = event.getTouch(displayTarget);
		//var touches:Vector.<Touch> = event.getTouches(displayTarget);
		if (touch) {
			//trace(itemName, touch.phase, "          ", touches);
			if (touch.phase == TouchPhase.ENDED) {
				if (_mouseUpSignal) {
					_mouseUpSignal.dispatch(event);
				}
				if (doubleClickEnabled) {
					var time:int = getTimer();
					if (time - lastClick < DOUBLE_CLICK_TIME) {
						if (_doubleClickSignal) {
							_doubleClickSignal.dispatch(event);
						}
					} else {
						if (_clickSignal) {
							_clickSignal.dispatch(event);
						}
						lastClick = time;
					}
				} else {
					if (_clickSignal) {
						_clickSignal.dispatch(event);
					}
				}
			} else if (touch.phase == TouchPhase.HOVER) {
				if (!isMouseOver) {
					isMouseOver = true;
					if (_mouseOverSignal) {
						_mouseOverSignal.dispatch(event);
					}
				}
				if (_mouseMoveSignal) {
					_mouseMoveSignal.dispatch(event);
				}
			} else if (touch.phase == TouchPhase.BEGAN) {
				if (_mouseDownSignal) {
					_mouseDownSignal.dispatch(event);
				}
			} else if (touch.phase == TouchPhase.MOVED) {
				//trace(itemName, "drag???");
				if (_mouseMoveSignal) {
					_mouseMoveSignal.dispatch(event);
				}
			} else {
				//trace("Unhandled touch phase : ", touch.phase);
			}
		} else {
			if (isMouseOver) {
				isMouseOver = false;
				if (_mouseOutSignal) {
					_mouseOutSignal.dispatch(event);
				}
			}
		}
	}

}
}
