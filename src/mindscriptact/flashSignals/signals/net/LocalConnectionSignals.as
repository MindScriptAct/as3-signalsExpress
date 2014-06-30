package mindscriptact.flashSignals.signals.net {
import flash.events.AsyncErrorEvent;
import flash.events.NetStatusEvent;
import flash.events.SecurityErrorEvent;
import flash.events.StatusEvent;
import flash.net.LocalConnection;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class LocalConnectionSignals extends EventDispatcherSignals {

	public function LocalConnectionSignals(target:LocalConnection) {
		super(target);
	}

	public function get status():NativeSignalExpress {return getNativeSignal(StatusEvent.STATUS, StatusEvent);}//[Event(name="status",type="flash.events.StatusEvent")]

	public function get securityError():NativeSignalExpress {return getNativeSignal(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);}//[Event(name="securityError",type="flash.events.SecurityErrorEvent")]
	public function get asyncError():NativeSignalExpress {return getNativeSignal(AsyncErrorEvent.ASYNC_ERROR, AsyncErrorEvent);}//[Event(name="asyncError",type="flash.events.AsyncErrorEvent")]

}
}
