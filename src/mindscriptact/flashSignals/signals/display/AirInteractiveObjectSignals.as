package mindscriptact.flashSignals.signals.display {
import flash.display.InteractiveObject;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.IMEEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.SoftKeyboardEvent;
import flash.events.TextEvent;
import flash.events.TouchEvent;
import flash.events.TransformGestureEvent;

import mindscriptact.flashSignals.NativeSignalExpress;
import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class AirInteractiveObjectSignals extends InteractiveObjectSignals {

	public function AirInteractiveObjectSignals(spriteExpress:InteractiveObject) {
		super(spriteExpress);
	}

	public function get softKeyboardDeactivate ():NativeSignalExpress {return getNativeSignal(SoftKeyboardEvent.SOFT_KEYBOARD_DEACTIVATE, SoftKeyboardEvent);}//[Event(name="softKeyboardDeactivate",type="flash.events.SoftKeyboardEvent")]
	public function get softKeyboardActivate   ():NativeSignalExpress {return getNativeSignal(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATE, SoftKeyboardEvent);}//[Event(name="softKeyboardActivate",type="flash.events.SoftKeyboardEvent")]
	public function get softKeyboardActivating ():NativeSignalExpress {return getNativeSignal(SoftKeyboardEvent.SOFT_KEYBOARD_ACTIVATING, SoftKeyboardEvent);}//[Event(name="softKeyboardActivating",type="flash.events.SoftKeyboardEvent")]
	public function get textInput              ():NativeSignalExpress {return getNativeSignal(TextEvent.TEXT_INPUT, TextEvent);}//[Event(name="textInput",type="flash.events.TextEvent")]

	public function get imeStartComposition    ():NativeSignalExpress {return getNativeSignal(IMEEvent.IME_START_COMPOSITION, IMEEvent);}//[Event(name="imeStartComposition",type="flash.events.IMEEvent")]

	public function get contextMenu            ():NativeSignalExpress {return getNativeSignal(MouseEvent.CONTEXT_MENU, MouseEvent);}//[Event(name="contextMenu",type="flash.events.MouseEvent")]

	public function get nativeDragStart        ():NativeSignalExpress {return getNativeSignal("nativeDragStart");}//[Event(name="nativeDragStart",type="flash.events.NativeDragEvent")]
	public function get nativeDragUpdate       ():NativeSignalExpress {return getNativeSignal("nativeDragUpdate");}//[Event(name="nativeDragUpdate",type="flash.events.NativeDragEvent")]
	public function get nativeDragComplete     ():NativeSignalExpress {return getNativeSignal("nativeDragComplete");}//[Event(name="nativeDragComplete",type="flash.events.NativeDragEvent")]
	public function get nativeDragEnter        ():NativeSignalExpress {return getNativeSignal("nativeDragEnter");}//[Event(name="nativeDragEnter",type="flash.events.NativeDragEvent")]
	public function get nativeDragOver         ():NativeSignalExpress {return getNativeSignal("nativeDragOver");}//[Event(name="nativeDragOver",type="flash.events.NativeDragEvent")]
	public function get nativeDragDrop         ():NativeSignalExpress {return getNativeSignal("nativeDragDrop");}//[Event(name="nativeDragDrop",type="flash.events.NativeDragEvent")]
	public function get nativeDragExit         ():NativeSignalExpress {return getNativeSignal("nativeDragExit");}//[Event(name="nativeDragExit",type="flash.events.NativeDragEvent")]

	public function get rightMouseUp           ():NativeSignalExpress {return getNativeSignal(MouseEvent.RIGHT_MOUSE_UP, MouseEvent);}//[Event(name="rightMouseUp",type="flash.events.MouseEvent")]
	public function get rightMouseDown         ():NativeSignalExpress {return getNativeSignal(MouseEvent.RIGHT_MOUSE_DOWN, MouseEvent);}//[Event(name="rightMouseDown",type="flash.events.MouseEvent")]
	public function get rightClick             ():NativeSignalExpress {return getNativeSignal(MouseEvent.RIGHT_CLICK, MouseEvent);}//[Event(name="rightClick",type="flash.events.MouseEvent")]
	public function get middleMouseUp          ():NativeSignalExpress {return getNativeSignal(MouseEvent.MIDDLE_MOUSE_UP, MouseEvent);}//[Event(name="middleMouseUp",type="flash.events.MouseEvent")]
	public function get middleMouseDown        ():NativeSignalExpress {return getNativeSignal(MouseEvent.MIDDLE_MOUSE_DOWN, MouseEvent);}//[Event(name="middleMouseDown",type="flash.events.MouseEvent")]
	public function get middleClick            ():NativeSignalExpress {return getNativeSignal(MouseEvent.MIDDLE_CLICK, MouseEvent);}//[Event(name="middleClick",type="flash.events.MouseEvent")]

	public function get gestureSwipe           ():NativeSignalExpress {return getNativeSignal(TransformGestureEvent.GESTURE_SWIPE, TransformGestureEvent);}//[Event(name="gestureSwipe",type="flash.events.TransformGestureEvent")]
	public function get gestureZoom            ():NativeSignalExpress {return getNativeSignal(TransformGestureEvent.GESTURE_ZOOM, TransformGestureEvent);}//[Event(name="gestureZoom",type="flash.events.TransformGestureEvent")]
	public function get gestureRotate          ():NativeSignalExpress {return getNativeSignal(TransformGestureEvent.GESTURE_ROTATE, TransformGestureEvent);}//[Event(name="gestureRotate",type="flash.events.TransformGestureEvent")]
	public function get gesturePan             ():NativeSignalExpress {return getNativeSignal(TransformGestureEvent.GESTURE_PAN, TransformGestureEvent);}//[Event(name="gesturePan",type="flash.events.TransformGestureEvent")]

	public function get gestureTap             ():NativeSignalExpress {return getNativeSignal("gestureTap");}//[Event(name="gestureTap",type="flash.events.TapGestureEvent")]
	public function get gestureLongPress       ():NativeSignalExpress {return getNativeSignal("gestureLongPress");}//[Event(name="gestureLongPress",type="flash.events.TapGestureEvent")]

	public function get touchTap               ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_TAP, TouchEvent);}//[Event(name="touchTap",type="flash.events.TouchEvent")]
	public function get touchRollOver          ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_ROLL_OVER, TouchEvent);}//[Event(name="touchRollOver",type="flash.events.TouchEvent")]
	public function get touchRollOut           ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_ROLL_OUT, TouchEvent);}//[Event(name="touchRollOut",type="flash.events.TouchEvent")]
	public function get touchOver              ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_ROLL_OVER, TouchEvent);}//[Event(name="touchOver",type="flash.events.TouchEvent")]
	public function get touchOut               ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_OUT, TouchEvent);}//[Event(name="touchOut",type="flash.events.TouchEvent")]
	public function get proximityRollOver      ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_ROLL_OVER, TouchEvent);}//[Event(name="proximityRollOver",type="flash.events.TouchEvent")]
	public function get proximityRollOut       ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_ROLL_OUT, TouchEvent);}//[Event(name="proximityRollOut",type="flash.events.TouchEvent")]
	public function get proximityOver          ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_OVER, TouchEvent);}//[Event(name="proximityOver",type="flash.events.TouchEvent")]
	public function get proximityOut           ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_OUT, TouchEvent);}//[Event(name="proximityOut",type="flash.events.TouchEvent")]
	public function get proximityMove          ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_MOVE, TouchEvent);}//[Event(name="proximityMove",type="flash.events.TouchEvent")]
	public function get proximityEnd           ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_END, TouchEvent );}//[Event(name="proximityEnd",type="flash.events.TouchEvent")]
	public function get proximityBegin         ():NativeSignalExpress {return getNativeSignal(TouchEvent.PROXIMITY_BEGIN, TouchEvent);}//[Event(name="proximityBegin",type="flash.events.TouchEvent")]
	public function get touchMove              ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_MOVE, TouchEvent);}//[Event(name="touchMove",type="flash.events.TouchEvent")]
	public function get touchEnd               ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_END, TouchEvent);}//[Event(name="touchEnd",type="flash.events.TouchEvent")]
	public function get touchBegin             ():NativeSignalExpress {return getNativeSignal(TouchEvent.TOUCH_BEGIN, TouchEvent);}//[Event(name="touchBegin",type="flash.events.TouchEvent")]

}
}
