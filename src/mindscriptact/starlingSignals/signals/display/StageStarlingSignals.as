package mindscriptact.starlingSignals.signals.display {
import mindscriptact.starlingSignals.NativeSignalStarlingExpress;
import mindscriptact.starlingSignals.signals.touch.TouchObjectStarlingSignals;

import starling.display.Stage;
import starling.events.ResizeEvent;

public class StageStarlingSignals extends TouchObjectStarlingSignals {

	public function StageStarlingSignals(target:Stage) {
		super(target);
	}


	public function get resize():NativeSignalStarlingExpress {return getNativeSignal(ResizeEvent.RESIZE, ResizeEvent);}//[Event(name="resize", type="starling.events.ResizeEvent")]

}
}
