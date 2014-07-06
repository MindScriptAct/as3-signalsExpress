package performanceCheck.starlingExpress {
import flash.utils.setTimeout;

import mindscriptact.starlingSignals.display.ImageStarlingExpress;

import performanceCheck.PerfarmanceCheckStarlingExpressMain;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.textures.Texture;

import utils.debug.Stats;

public class PerfStarlingExpressRoot extends Sprite {

	// Embed the texture:
	[Embed(source="/assets/testPic.png")]
	public static const TestPic:Class;

	private var texture:Texture;
	private var images:Vector.<ImageStarlingExpress> = new <ImageStarlingExpress>[];
	private var tweens:Vector.<Tween> = new <Tween>[];
	private var touchCount:int;
	private var imagePool:Vector.<ImageStarlingExpress> = new <ImageStarlingExpress>[];
	private var tweenPool:Vector.<Tween> = new <Tween>[];

	public function PerfStarlingExpressRoot() {

		// create the texture:
		texture = Texture.fromBitmap(new TestPic());

		for (var i:int = 0; i < 100; i++) {
			addPic();
		}

		setTimeout(doTest, 2000);
	}


	private function addPic():void {
		// display the texture through an Image:
		var image:ImageStarlingExpress;
		var tween:Tween;
		if (imagePool.length) {
			image = imagePool.pop();
			tween = tweenPool.pop();
		} else {
			image = new ImageStarlingExpress(texture);
			tween = new Tween(image, 1, Transitions.EASE_IN_OUT_BACK);
		}

		image.pivotX = 50;
		image.pivotY = 50;

		image.x = Math.random() * 800;
		image.y = Math.random() * 800;

		this.addChild(image);


		tween.animate("scaleX", 0.5);
		tween.animate("scaleY", 0.5);
		tween.animate("alpha", 0.5);
		tween.animate("rotation", Math.PI * 2);
		tween.repeatCount = int.MAX_VALUE;
		Starling.juggler.add(tween);

		images.push(image);
		tweens.push(tween);

		//image.addEventListener(TouchEvent.TOUCH, handleTouch);
		image.signals.mouseOver.add(handleTouch);
		image.signals.mouseOut.add(handleTouch);
		image.signals.mouseMove.add(handleTouch);
	}

	private function handleTouch(event:TouchEvent):void {
		touchCount++;
	}

	private function removePic():void {
		var image:ImageStarlingExpress = images.shift();
		var tween:Tween = tweens.shift();

		Starling.juggler.remove(tween);

		image.removeEventListener(TouchEvent.TOUCH, handleTouch)
		this.removeChild(image);
		//image.dispose();

		imagePool.push(image);
		tweenPool.push(tween);
	}

	private function doTest():void {

		var stats:Stats = PerfarmanceCheckStarlingExpressMain.stats;

		var diff:int = stats.getFps() - 30;

		trace(diff);

		if (diff > 0) {
			for (var i:int = 0; i < diff; i++) {
				addPic();
			}
		} else {
			for (i = 0; i > diff; i--) {
				removePic();
			}
		}

		PerfarmanceCheckStarlingExpressMain.output.text = "" + images.length;
		PerfarmanceCheckStarlingExpressMain.outputHover.text = "" + touchCount;

		touchCount = 0;

		setTimeout(doTest, 300)
	}

}
}
