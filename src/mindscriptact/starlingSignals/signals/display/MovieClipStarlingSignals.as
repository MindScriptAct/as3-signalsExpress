package mindscriptact.starlingSignals.signals.display {
import mindscriptact.starlingSignals.NativeSignalStarlingExpress;
import mindscriptact.starlingSignals.signals.touch.TouchObjectStarlingSignals;

import starling.display.MovieClip;

import starling.events.Event;

public class MovieClipStarlingSignals extends TouchObjectStarlingSignals {

	public function MovieClipStarlingSignals(target:MovieClip) {
		super(target);
	}


	public function get complete():NativeSignalStarlingExpress {return getNativeSignal(Event.COMPLETE);}//[Event(name="complete", type="starling.events.Event")]

}
}
