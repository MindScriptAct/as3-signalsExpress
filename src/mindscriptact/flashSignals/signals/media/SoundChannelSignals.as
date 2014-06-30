package mindscriptact.flashSignals.signals.media {
import flash.events.Event;
import flash.media.SoundChannel;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class SoundChannelSignals extends EventDispatcherSignals {

	public function SoundChannelSignals(target:SoundChannel) {
		super(target);
	}

	public function get soundComplete():NativeSignalExpress {return getNativeSignal(Event.SOUND_COMPLETE);}//[Event(name="soundComplete",type="flash.events.Event")]
}
}
