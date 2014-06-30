package mindscriptact.flashSignals.signals.utils {
import flash.events.TimerEvent;
import flash.utils.Timer;

import mindscriptact.flashSignals.NativeSignalExpress;

import mindscriptact.flashSignals.signals.EventDispatcherSignals;

public class TimerSignals extends EventDispatcherSignals {

	public function TimerSignals(target:Timer) {
		super(target);
	}

	public function get timer():NativeSignalExpress {return getNativeSignal(TimerEvent.TIMER, TimerEvent);}//[Event(name="timer",type="flash.events.TimerEvent")]
	public function get timerComplete():NativeSignalExpress {return getNativeSignal(TimerEvent.TIMER_COMPLETE, TimerEvent);}//[Event(name="timerComplete",type="flash.events.TimerEvent")]

}
}
