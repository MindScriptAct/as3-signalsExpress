package starlingExpressObj {

import flash.display.Sprite;

import starling.core.Starling;

import starlingExpressObj.flash.FlashSampleRoot;
import starlingExpressObj.starling.StarlingSampleRoot;

public class StarlingExpressTestMain extends Sprite {

	private var _starling:Starling;

	public function StarlingExpressTestMain() {

		_starling = new Starling(StarlingSampleRoot, stage);
		_starling.stage.color = 0xEEEEEE;
		_starling.start();


		var flashRoot:FlashSampleRoot = new FlashSampleRoot();
		this.addChild(flashRoot);

	}
}
}
