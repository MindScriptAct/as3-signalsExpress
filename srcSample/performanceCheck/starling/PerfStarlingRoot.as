package performanceCheck.starling {
import flash.utils.setTimeout;

import performanceCheck.PerfarmanceCheckStarlingMain;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.TouchEvent;
import starling.textures.Texture;

import utils.debug.Stats;

public class PerfStarlingRoot extends Sprite {

	// Embed the texture:
	[Embed(source="/assets/testPic.png")]
	public static const TestPic:Class;

	private var texture:Texture;
	private var images:Vector.<Image> = new <Image>[];
	private var tweens:Vector.<Tween> = new <Tween>[];
	private var touchCount:int;
	private var imagePool:Vector.<Image> = new <Image>[];
	private var tweenPool:Vector.<Tween> = new <Tween>[];

	public function PerfStarlingRoot() {

		// create the texture:
		texture = Texture.fromBitmap(new TestPic());

		for (var i:int = 0; i < 100; i++) {
			addPic();
		}

		setTimeout(doTest, 2000);
	}


	private function addPic():void {
		// display the texture through an Image:
		var image:Image;
		var tween:Tween;
		if (imagePool.length) {
			image = imagePool.pop();
			tween = tweenPool.pop();
		} else {
			image = new Image(texture);
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

		image.addEventListener(TouchEvent.TOUCH, handleTouch);
	}

	private function handleTouch(event:TouchEvent):void {
		touchCount++;
	}

	private function removePic():void {
		var image:Image = images.shift();
		var tween:Tween = tweens.shift();

		Starling.juggler.remove(tween);

		image.removeEventListener(TouchEvent.TOUCH, handleTouch)
		this.removeChild(image);
		//image.dispose();

		imagePool.push(image);
		tweenPool.push(tween);
	}

	private function doTest():void {

		var stats:Stats = PerfarmanceCheckStarlingMain.stats;

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

		PerfarmanceCheckStarlingMain.output.text = "" + images.length;
		PerfarmanceCheckStarlingMain.outputHover.text = "" + touchCount;

		touchCount = 0;

		setTimeout(doTest, 300)
	}

}
}
