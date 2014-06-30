package mindscriptact.flashSignals.signals.display {
import flash.display.LoaderInfo;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class LoaderInfoSignals extends EventDispatcherSignals {

	public function LoaderInfoSignals(target:LoaderInfo) {
		super(target);
	}

	public function get init():NativeSignalExpress {return getNativeSignal(Event.INIT);}//[Event(name="init",type="flash.events.Event")]
	public function get open():NativeSignalExpress {return getNativeSignal(Event.OPEN);}//[Event(name="open",type="flash.events.Event")]
	public function get complete():NativeSignalExpress {return getNativeSignal(Event.COMPLETE);}//[Event(name="complete",type="flash.events.Event")]

	public function get progress():NativeSignalExpress {return getNativeSignal(ProgressEvent.PROGRESS, ProgressEvent);}//[Event(name="progress",type="flash.events.ProgressEvent")]
	public function get httpStatus():NativeSignalExpress {return getNativeSignal(HTTPStatusEvent.HTTP_STATUS, HTTPStatusEvent);}//[Event(name="httpStatus",type="flash.events.HTTPStatusEvent")]

	public function get unload():NativeSignalExpress {return getNativeSignal(Event.UNLOAD);}//[Event(name="unload",type="flash.events.Event")]
	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]

}
}
