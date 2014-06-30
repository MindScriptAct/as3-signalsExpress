package mindscriptact.flashSignals.signals.display {
import flash.display.InteractiveObject;
import flash.events.Event;
import flash.events.FocusEvent;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.events.TextEvent;
import flash.system.Capabilities;

import mindscriptact.flashSignals.NativeSignalExpress;
import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class InteractiveObjectSignals extends DisplayObjectSignals {

	public function InteractiveObjectSignals(spriteExpress:InteractiveObject) {
		super(spriteExpress);
	}

	// mouse
	public function get click():NativeSignalExpress {return getNativeSignal(MouseEvent.CLICK, MouseEvent);}//[Event(name="click",type="flash.events.MouseEvent")]
	public function get doubleClick():NativeSignalExpress {return getNativeSignal(MouseEvent.DOUBLE_CLICK, MouseEvent);}//[Event(name="doubleClick",type="flash.events.MouseEvent")]
	
	public function get mouseDown():NativeSignalExpress {return getNativeSignal(MouseEvent.MOUSE_DOWN, MouseEvent);}//[Event(name="mouseDown",type="flash.events.MouseEvent")]
	public function get mouseUp():NativeSignalExpress {return getNativeSignal(MouseEvent.MOUSE_UP, MouseEvent);}//[Event(name="mouseUp",type="flash.events.MouseEvent")]
	public function get mouseOver():NativeSignalExpress {return getNativeSignal(MouseEvent.MOUSE_OVER, MouseEvent);}//[Event(name="mouseOver",type="flash.events.MouseEvent")]
	public function get mouseOut():NativeSignalExpress {return getNativeSignal(MouseEvent.MOUSE_OUT, MouseEvent);}//[Event(name="mouseOut",type="flash.events.MouseEvent")]
	public function get mouseMove():NativeSignalExpress {return getNativeSignal(MouseEvent.MOUSE_MOVE, MouseEvent);}//[Event(name="mouseMove",type="flash.events.MouseEvent")]

	public function get mouseWheel():NativeSignalExpress {return getNativeSignal(MouseEvent.MOUSE_WHEEL, MouseEvent);}//[Event(name="mouseWheel",type="flash.events.MouseEvent")]
	
	public function get rollOver():NativeSignalExpress {return getNativeSignal(MouseEvent.ROLL_OVER, MouseEvent);}//[Event(name="rollOver",type="flash.events.MouseEvent")]
	public function get rollOut():NativeSignalExpress {return getNativeSignal(MouseEvent.ROLL_OUT, MouseEvent);}//[Event(name="rollOut",type="flash.events.MouseEvent")]

	public function get releaseOutside():NativeSignalExpress {
		CONFIG::debug {
			var versionArray:Array = Capabilities.version.split(",");// Split it up
			var major:int = parseInt(versionArray[0].split(" ")[1]);
			var minor:int = parseInt(versionArray[1]);
			if(major < 11 || (major == 11 && minor < 3) ){
				throw Error("'releaseOutside' event is supported only by flash player 11.3 and up.");
			}
		}
		return getNativeSignal("releaseOutside", MouseEvent);
	}//[Event(name="releaseOutside",type="flash.events.MouseEvent")]

	// keyboard events
	public function get keyUp():NativeSignalExpress {return getNativeSignal(KeyboardEvent.KEY_UP, KeyboardEvent);}//[Event(name="keyUp",type="flash.events.KeyboardEvent")]
	public function get keyDown():NativeSignalExpress {return getNativeSignal(KeyboardEvent.KEY_DOWN, KeyboardEvent);}//[Event(name="keyDown",type="flash.events.KeyboardEvent")]

	// focus events
	public function get focusIn():NativeSignalExpress {return getNativeSignal(FocusEvent.FOCUS_IN, FocusEvent);}//[Event(name="focusIn",type="flash.events.FocusEvent")]
	public function get focusOut():NativeSignalExpress {return getNativeSignal(FocusEvent.FOCUS_OUT, FocusEvent);}//[Event(name="focusOut",type="flash.events.FocusEvent")]
	public function get mouseFocusChange():NativeSignalExpress {return getNativeSignal(FocusEvent.MOUSE_FOCUS_CHANGE, FocusEvent);}//[Event(name="mouseFocusChange",type="flash.events.FocusEvent")]
	public function get keyFocusChange():NativeSignalExpress {return getNativeSignal(FocusEvent.KEY_FOCUS_CHANGE, FocusEvent);}//[Event(name="keyFocusChange",type="flash.events.FocusEvent")]

	//  tab through interactive objects events
	public function get tabIndexChange():NativeSignalExpress {return getNativeSignal(Event.TAB_INDEX_CHANGE);}//[Event(name="tabIndexChange",type="flash.events.Event")]
	public function get tabChildrenChange():NativeSignalExpress {return getNativeSignal(Event.TAB_CHILDREN_CHANGE);}//[Event(name="tabChildrenChange",type="flash.events.Event")]
	public function get tabEnabledChange():NativeSignalExpress {return getNativeSignal(Event.TAB_ENABLED_CHANGE);}//[Event(name="tabEnabledChange",type="flash.events.Event")]

	// text
	public function get textInput():NativeSignalExpress {return getNativeSignal(TextEvent.TEXT_INPUT, TextEvent);}//[Event(name="textInput",type="flash.events.TextEvent")]

	// advanced text events.
	public function get copy():NativeSignalExpress {return getNativeSignal(Event.COPY);}//[Event(name="copy",type="flash.events.Event")]
	public function get cut():NativeSignalExpress {return getNativeSignal(Event.CUT);}//[Event(name="cut",type="flash.events.Event")]
	public function get paste():NativeSignalExpress {return getNativeSignal(Event.PASTE);}//[Event(name="paste",type="flash.events.Event")]
	public function get selectAll():NativeSignalExpress {return getNativeSignal(Event.SELECT_ALL);}//[Event(name="selectAll",type="flash.events.Event")]
	public function get clear():NativeSignalExpress {return getNativeSignal(Event.CLEAR);}//[Event(name="clear",type="flash.events.Event")]

}
}
