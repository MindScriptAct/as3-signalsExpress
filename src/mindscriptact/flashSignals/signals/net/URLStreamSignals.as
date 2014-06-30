package mindscriptact.flashSignals.signals.net {
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.URLStream;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class URLStreamSignals extends EventDispatcherSignals {

	public function URLStreamSignals(target:URLStream) {
		super(target);
	}

	public function get open():NativeSignalExpress {return getNativeSignal(Event.OPEN);}//[Event(name="open",type="flash.events.Event")]
	public function get progress():NativeSignalExpress {return getNativeSignal(ProgressEvent.PROGRESS, ProgressEvent);}//[Event(name="progress",type="flash.events.ProgressEvent")]
	public function get httpStatus():NativeSignalExpress {return getNativeSignal(HTTPStatusEvent.HTTP_STATUS, HTTPStatusEvent);}//[Event(name="httpStatus",type="flash.events.HTTPStatusEvent")]
	public function get complete():NativeSignalExpress {return getNativeSignal(Event.COMPLETE);}//[Event(name="complete",type="flash.events.Event")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public function get securityError():NativeSignalExpress {return getNativeSignal(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);}//[Event(name="securityError",type="flash.events.SecurityErrorEvent")]
}
}
