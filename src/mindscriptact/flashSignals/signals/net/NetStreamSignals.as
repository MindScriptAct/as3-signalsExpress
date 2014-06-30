package mindscriptact.flashSignals.signals.net {
import flash.events.AsyncErrorEvent;
import flash.events.IOErrorEvent;
import flash.events.NetStatusEvent;
import flash.net.NetStream;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class NetStreamSignals extends EventDispatcherSignals {

	public function NetStreamSignals(target:NetStream) {
		super(target);
	}

	public function get netStatus():NativeSignalExpress {return getNativeSignal(NetStatusEvent.NET_STATUS, NetStatusEvent);}//[Event(name="netStatus",type="flash.events.NetStatusEvent")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public function get asyncError():NativeSignalExpress {return getNativeSignal(AsyncErrorEvent.ASYNC_ERROR, AsyncErrorEvent);}//[Event(name="asyncError",type="flash.events.AsyncErrorEvent")]

}
}
