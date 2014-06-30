/**
 * Created by Deril on 2014.06.24.
 */
package test {
import flash.display.Sprite;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.IMEEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.SoftKeyboardEvent;
import flash.events.TextEvent;
import flash.events.TouchEvent;
import flash.events.TransformGestureEvent;

public class DeletMe {
	public function DeletMe() {

		var test:Sprite = new Sprite();

		test.addEventListener(Event.ACTIVATE, debug);
		test.addEventListener(Event.ADDED, debug);
		test.addEventListener(Event.ADDED_TO_STAGE, debug);
		test.addEventListener(Event.CLEAR, debug);
		test.addEventListener(Event.COPY, debug);
		test.addEventListener(Event.CUT, debug);
		test.addEventListener(Event.DEACTIVATE, debug);
		test.addEventListener(Event.ENTER_FRAME, debug);
		test.addEventListener(Event.EXIT_FRAME, debug);
		test.addEventListener(Event.FRAME_CONSTRUCTED, debug);
		test.addEventListener(Event.PASTE, debug);
		test.addEventListener(Event.REMOVED, debug);
		test.addEventListener(Event.REMOVED_FROM_STAGE, debug);
		test.addEventListener(Event.RENDER, debug);
		test.addEventListener(Event.SELECT_ALL, debug);
		test.addEventListener(Event.TAB_CHILDREN_CHANGE, debug);
		test.addEventListener(Event.TAB_ENABLED_CHANGE, debug);
		test.addEventListener(Event.TAB_INDEX_CHANGE, debug);
		test.addEventListener(FocusEvent.FOCUS_IN, debug);
		test.addEventListener(FocusEvent.FOCUS_OUT, debug);
		test.addEventListener(FocusEvent.KEY_FOCUS_CHANGE, debug);
		test.addEventListener(FocusEvent.MOUSE_FOCUS_CHANGE, debug);
		test.addEventListener(IMEEvent.IME_START_COMPOSITION, debug);
		test.addEventListener(KeyboardEvent.KEY_DOWN, debug);
		test.addEventListener(KeyboardEvent.KEY_UP, debug);
		test.addEventListener(MouseEvent.CLICK, debug);
		test.addEventListener(MouseEvent.CONTEXT_MENU, debug);
		test.addEventListener(MouseEvent.DOUBLE_CLICK, debug);
		test.addEventListener(MouseEvent.MIDDLE_CLICK, debug);
		test.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, debug);
		test.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, debug);
		test.addEventListener(MouseEvent.MOUSE_DOWN, debug);
		test.addEventListener(MouseEvent.MOUSE_MOVE, debug);
		test.addEventListener(MouseEvent.MOUSE_OUT, debug);
		test.addEventListener(MouseEvent.MOUSE_OVER, debug);
		test.addEventListener(MouseEvent.MOUSE_UP, debug);
		test.addEventListener(MouseEvent.MOUSE_WHEEL, debug);
		test.addEventListener(MouseEvent.RELEASE_OUTSIDE, debug);
		test.addEventListener(MouseEvent.RIGHT_CLICK, debug);
		test.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, debug);
		test.addEventListener(MouseEvent.RIGHT_MOUSE_UP, debug);
		test.addEventListener(MouseEvent.ROLL_OUT, debug);
		test.addEventListener(MouseEvent.ROLL_OVER, debug);
		test.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE, debug);
		test.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATING, debug);
		test.addEventListener(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE, debug);
		test.addEventListener(TextEvent.TEXT_INPUT, debug);
		test.addEventListener(TouchEvent.PROXIMITY_BEGIN, debug);
		test.addEventListener(TouchEvent.PROXIMITY_END, debug);
		test.addEventListener(TouchEvent.PROXIMITY_MOVE, debug);
		test.addEventListener(TouchEvent.PROXIMITY_OUT, debug);
		test.addEventListener(TouchEvent.PROXIMITY_OVER, debug);
		test.addEventListener(TouchEvent.PROXIMITY_ROLL_OUT, debug);
		test.addEventListener(TouchEvent.PROXIMITY_ROLL_OVER, debug);
		test.addEventListener(TouchEvent.TOUCH_BEGIN, debug);
		test.addEventListener(TouchEvent.TOUCH_END, debug);
		test.addEventListener(TouchEvent.TOUCH_MOVE, debug);
		test.addEventListener(TouchEvent.TOUCH_OUT, debug);
		test.addEventListener(TouchEvent.TOUCH_OVER, debug);
		test.addEventListener(TouchEvent.TOUCH_ROLL_OUT, debug);
		test.addEventListener(TouchEvent.TOUCH_ROLL_OVER, debug);
		test.addEventListener(TouchEvent.TOUCH_TAP, debug);
		test.addEventListener(TransformGestureEvent.GESTURE_PAN, debug);
		test.addEventListener(TransformGestureEvent.GESTURE_ROTATE, debug);
		test.addEventListener(TransformGestureEvent.GESTURE_SWIPE, debug);
		test.addEventListener(TransformGestureEvent.GESTURE_ZOOM, debug);

	}



	private function debug(event:Event):void {

	}
}
}
