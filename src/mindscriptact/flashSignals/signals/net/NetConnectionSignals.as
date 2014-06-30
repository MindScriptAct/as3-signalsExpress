package mindscriptact.flashSignals.signals.net {
import flash.events.AsyncErrorEvent;
import flash.events.IOErrorEvent;
import flash.events.NetStatusEvent;
import flash.events.SecurityErrorEvent;
import flash.net.NetConnection;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class NetConnectionSignals extends EventDispatcherSignals {

	public function NetConnectionSignals(target:NetConnection) {
		super(target);
	}

	public function get netStatus():NativeSignalExpress {return getNativeSignal(NetStatusEvent.NET_STATUS, NetStatusEvent);}//[Event(name="netStatus",type="flash.events.NetStatusEvent")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public function get securityError():NativeSignalExpress {return getNativeSignal(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);}//[Event(name="securityError",type="flash.events.SecurityErrorEvent")]
	public function get asyncError():NativeSignalExpress {return getNativeSignal(AsyncErrorEvent.ASYNC_ERROR);}//[Event(name="asyncError",type="flash.events.AsyncErrorEvent")]

}
}
