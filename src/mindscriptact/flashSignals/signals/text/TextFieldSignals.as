package mindscriptact.flashSignals.signals.text {
import flash.events.Event;
import flash.events.TextEvent;
import flash.text.TextField;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.display.InteractiveObjectSignals;

public class TextFieldSignals extends InteractiveObjectSignals {

	public function TextFieldSignals(spriteExpress:TextField) {
		super(spriteExpress);
		Event
	}

	public function get textInput():NativeSignalExpress {return getNativeSignal(TextEvent.TEXT_INPUT, TextEvent);}//[Event(name="textInput",type="flash.events.TextEvent")]
	public function get link():NativeSignalExpress {return getNativeSignal(TextEvent.LINK);}//[Event(name="link",type="flash.events.TextEvent")]

	public function get scroll():NativeSignalExpress {return getNativeSignal(Event.SCROLL);}//[Event(name="scroll",type="flash.events.Event")]
	public function get change():NativeSignalExpress {return getNativeSignal(Event.CHANGE);}//[Event(name="change",type="flash.events.")]


}
}