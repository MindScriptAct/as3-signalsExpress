package mindscriptact.flashSignals.signals.display {
import flash.display.NativeMenu;
import flash.events.Event;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

[API("667")]
public class NativeMenuSignals extends EventDispatcherSignals {

	public function NativeMenuSignals(target:NativeMenu) {
		super(target);
	}

	public function get preparing():NativeSignalExpress {return getNativeSignal("preparing");}//[Event(name="preparing",type="flash.events.Event")]
	public function get displaying():NativeSignalExpress {return getNativeSignal("displaying");}//[Event(name="displaying",type="flash.events.Event")]

	public function get select():NativeSignalExpress {return getNativeSignal(Event.SELECT);}//[Event(name="select",type="flash.events.Event")]



}
}
