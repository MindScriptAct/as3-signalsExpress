package mindscriptact.starlingSignals.signals.display {
import mindscriptact.starlingSignals.NativeSignalStarlingExpress;
import mindscriptact.starlingSignals.signals.touch.TouchObjectStarlingSignals;

import starling.display.Sprite;
import starling.events.Event;

public class SpriteStarlingSignals extends TouchObjectStarlingSignals {

	public function SpriteStarlingSignals(target:Sprite) {
		super(target);
	}


	public function get flatten():NativeSignalStarlingExpress {return getNativeSignal(Event.FLATTEN);}//[Event(name="flatten", type="starling.events.Event")]

}
}
