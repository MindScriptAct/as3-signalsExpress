package mindscriptact.flashSignals.signals.net {
import flash.events.DataEvent;
import flash.events.Event;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.net.FileReference;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class FileReferenceSignals extends EventDispatcherSignals {

	public function FileReferenceSignals(target:FileReference) {
		super(target);
	}

	public function get open():NativeSignalExpress {return getNativeSignal(Event.OPEN);}//[Event(name="open",type="flash.events.Event")]
	public function get complete():NativeSignalExpress {return getNativeSignal(Event.COMPLETE);}//[Event(name="complete",type="flash.events.Event")]

	public function get select():NativeSignalExpress {return getNativeSignal(Event.SELECT);}//[Event(name="select",type="flash.events.Event")]
	public function get cancel():NativeSignalExpress {return getNativeSignal(Event.CANCEL);}//[Event(name="cancel",type="flash.events.Event")]

	public function get progress():NativeSignalExpress {return getNativeSignal(ProgressEvent.PROGRESS);}//[Event(name="progress",type="flash.events.ProgressEvent")]
	public function get httpStatus():NativeSignalExpress {return getNativeSignal(HTTPStatusEvent.HTTP_STATUS, HTTPStatusEvent);}//[Event(name="httpStatus",type="flash.events.HTTPStatusEvent")]

	public function get uploadCompleteData():NativeSignalExpress {return getNativeSignal(DataEvent.UPLOAD_COMPLETE_DATA, DataEvent);}//[Event(name="uploadCompleteData",type="flash.events.DataEvent")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]
	public function get securityError():NativeSignalExpress {return getNativeSignal(SecurityErrorEvent.SECURITY_ERROR, SecurityErrorEvent);}//[Event(name="securityError",type="flash.events.SecurityErrorEvent")]

}
}
