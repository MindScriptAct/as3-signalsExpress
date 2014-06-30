package mindscriptact.flashSignals.signals.net {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.Socket;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class SocketSignals extends EventDispatcherSignals {

	public function SocketSignals(target:Socket) {
		super(target);
	}

	public function get connect():NativeSignalExpress {return getNativeSignal(Event.CONNECT);}//[Event(name="connect",type="flash.events.Event")]
	public function get socketData():NativeSignalExpress {return getNativeSignal(ProgressEvent.SOCKET_DATA, ProgressEvent);}//[Event(name="socketData",type="flash.events.ProgressEvent")]
	public function get close():NativeSignalExpress {return getNativeSignal(Event.CLOSE);}//[Event(name="close",type="flash.events.Event")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public function get securityError():NativeSignalExpress {return getNativeSignal(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);}//[Event(name="securityError",type="flash.events.SecurityErrorEvent")]
}
}
