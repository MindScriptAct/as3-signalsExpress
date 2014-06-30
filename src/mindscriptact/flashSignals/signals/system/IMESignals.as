package mindscriptact.flashSignals.signals.system {
import flash.events.IMEEvent;
import flash.system.IME;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class IMESignals extends EventDispatcherSignals {

	public function IMESignals(target:IME) {
		super(target);
	}

	public function get imeComposition():NativeSignalExpress {return getNativeSignal(IMEEvent.IME_COMPOSITION, IMEEvent);}//[Event(name="imeComposition",type="flash.events.IMEEvent")]

}
}
