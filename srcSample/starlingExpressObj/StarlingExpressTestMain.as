package starlingExpressObj {

import flash.display.Sprite;
import flash.geom.Rectangle;

import starling.core.Starling;

public class StarlingExpressTestMain extends Sprite {

	private var _starling:Starling;

	public function StarlingExpressTestMain() {
		_starling = new Starling(StarlingRoot, stage);
		_starling.stage.color = 0xEEEEEE;
		_starling.start();
	}
}
}
