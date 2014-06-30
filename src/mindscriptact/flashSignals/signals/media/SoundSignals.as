package mindscriptact.flashSignals.signals.media {
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.events.SampleDataEvent;
import flash.media.Sound;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class SoundSignals extends EventDispatcherSignals {

	public function SoundSignals(target:Sound) {
		super(target);
	}

	public function get open():NativeSignalExpress {return getNativeSignal(Event.OPEN);}//[Event(name="open",type="flash.events.Event")]
	public function get progress():NativeSignalExpress {return getNativeSignal(ProgressEvent.PROGRESS);}//[Event(name="progress",type="flash.events.ProgressEvent")]
	public function get sampleData():NativeSignalExpress {return getNativeSignal(SampleDataEvent.SAMPLE_DATA, SampleDataEvent);}//[Event(name="sampleData",type="flash.events.SampleDataEvent")]
	public function get complete():NativeSignalExpress {return getNativeSignal(Event.COMPLETE);}//[Event(name="complete",type="flash.events.Event")]

	public function get id3():NativeSignalExpress {return getNativeSignal(Event.ID3);}//[Event(name="id3",type="flash.events.Event")]

	public function get ioError():NativeSignalExpress {return getNativeSignal(IOErrorEvent.IO_ERROR, IOErrorEvent);}//[Event(name="ioError",type="flash.events.IOErrorEvent")]


}
}
