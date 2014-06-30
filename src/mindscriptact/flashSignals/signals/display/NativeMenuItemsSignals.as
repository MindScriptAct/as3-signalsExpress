package mindscriptact.flashSignals.signals.display {
import flash.display.NativeMenuItem;
import flash.events.Event;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class NativeMenuItemsSignals extends EventDispatcherSignals {

	public function NativeMenuItemsSignals(target:NativeMenuItem) {
		super(target);
	}

	public function get preparing():NativeSignalExpress {return getNativeSignal("preparing");}//[Event(name="preparing",type="flash.events.Event")]
	public function get displaying():NativeSignalExpress {return getNativeSignal("displaying");}//[Event(name="displaying",type="flash.events.Event")]

	public function get select():NativeSignalExpress {return getNativeSignal(Event.SELECT);}//[Event(name="select",type="flash.events.Event")]

}
}
