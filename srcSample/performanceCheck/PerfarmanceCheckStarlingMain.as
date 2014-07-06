package performanceCheck {
import flash.display.Sprite;
import flash.text.TextField;

import performanceCheck.starling.PerfStarlingRoot;

import starling.core.Starling;

import utils.debug.Stats;

[SWF(width="800", height="800", backgroundColor="#FFFFFF", frameRate="120")]
public class PerfarmanceCheckStarlingMain extends Sprite {

	private var _starling:Starling;

	public static var stats:Stats;
	public static var output:TextField;
	public static var outputHover:TextField;

	public function PerfarmanceCheckStarlingMain() {

		stats = new Stats(800, 0, 0, false, false, true);

		addChild(stats);

		output = new TextField();
		output.width = 50;
		output.height = 20;
		output.border = true;
		output.y = 100;
		output.scaleX = output.scaleY = 3;
		addChild(output);

		outputHover = new TextField();
		outputHover.width = 50;
		outputHover.height = 20;
		outputHover.border = true;
		outputHover.y = 100;
		outputHover.x = 180;
		outputHover.scaleX = outputHover.scaleY = 3;
		addChild(outputHover);

		output.background = true;
		output.backgroundColor = 0xFFFFFF;
		output.mouseEnabled = false;
		outputHover.background = true;
		outputHover.backgroundColor = 0xFFFFFF;
		outputHover.mouseEnabled = false;

		_starling = new Starling(PerfStarlingRoot, stage);
		_starling.start();
	}
}
}
