package mindscriptact.flashSignals.signals.net {
import flash.events.AsyncErrorEvent;
import flash.events.NetStatusEvent;
import flash.events.SyncEvent;
import flash.net.SharedObject;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class SharedObjectSignals extends EventDispatcherSignals {

	public function SharedObjectSignals(target:SharedObject) {
		super(target);
	}

	public function get netStatus():NativeSignalExpress {return getNativeSignal(NetStatusEvent.NET_STATUS, NetStatusEvent);}//[Event(name="netStatus",type="flash.events.NetStatusEvent")]
	public function get sync():NativeSignalExpress {return getNativeSignal(SyncEvent.SYNC, SyncEvent);}//[Event(name="sync",type="flash.events.SyncEvent")]

	public function get asyncError():NativeSignalExpress {return getNativeSignal(AsyncErrorEvent.ASYNC_ERROR, AsyncErrorEvent);}//[Event(name="asyncError",type="flash.events.AsyncErrorEvent")]

}
}
