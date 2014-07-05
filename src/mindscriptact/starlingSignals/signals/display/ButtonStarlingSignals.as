package mindscriptact.starlingSignals.signals.display {
import mindscriptact.starlingSignals.NativeSignalStarlingExpress;
import mindscriptact.starlingSignals.signals.touch.TouchObjectStarlingSignals;

import starling.display.Button;
import starling.events.Event;

public class ButtonStarlingSignals extends TouchObjectStarlingSignals {

	public function ButtonStarlingSignals(target:Button) {
		super(target);
	}


	public function get triggered():NativeSignalStarlingExpress {return getNativeSignal(Event.TRIGGERED);}//[Event(name="triggered", type="starling.events.Event")]

}
}
