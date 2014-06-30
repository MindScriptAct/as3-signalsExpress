package mindscriptact.flashSignals.signals.net {
import flash.events.Event;
import flash.net.FileReferenceList;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class FileReferenceListSignals extends EventDispatcherSignals {

	public function FileReferenceListSignals(target:FileReferenceList) {
		super(target);
	}

	public function get select():NativeSignalExpress {return getNativeSignal(Event.SELECT);}//[Event(name="select",type="flash.events.Event")]
	public function get cancel():NativeSignalExpress {return getNativeSignal(Event.CANCEL);}//[Event(name="cancel",type="flash.events.Event")]

}
}
