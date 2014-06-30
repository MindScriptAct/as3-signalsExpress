package mindscriptact.flashSignals.signals.net {
import flash.events.DataEvent;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.SecurityErrorEvent;
import flash.net.XMLSocket;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class XMLSocketSignals extends EventDispatcherSignals {

	public function XMLSocketSignals(target:XMLSocket) {
		super(target);
	}

	public function get connect():NativeSignalExpress {return getNativeSignal(Event.CONNECT);}//[Event(name="connect",type="flash.events.Event")]
	public function get data():NativeSignalExpress {return getNativeSignal(DataEvent.DATA, DataEvent);}//[Event(name="data",type="flash.events.DataEvent")]
	public function get close():NativeSignalExpress {return getNativeSignal(Event.CLOSE);}//[Event(name="close",type="flash.events.Event")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public function get securityError():NativeSignalExpress {return getNativeSignal(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);}//[Event(name="securityError",type="flash.events.SecurityErrorEvent")]

}
}
