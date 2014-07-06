package starlingExpressObj.starling {
import mindscriptact.starlingSignals.display.SpriteStarlingExpress;

import starling.animation.Transitions;
import starling.animation.Tween;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.textures.Texture;

public class StarlingExpressObjView extends SpriteStarlingExpress {

	private var testSprite:DisplayObject;
	private var clickSprite:Image;
	private var clickTween:Tween;
	private var dobleClickSprite:Image;
	private var doubleClickTween:Tween;

	public function StarlingExpressObjView() {

		var violetTexture:Texture = Texture.fromColor(100, 100, 0xFFFF00FF);

		testSprite = new Image(violetTexture);
		testSprite.pivotX = 50;
		testSprite.pivotY = 50;
		this.addChild(testSprite);


		var redTexture:Texture = Texture.fromColor(100, 100, 0xFFFF0000);

		dobleClickSprite = new Image(redTexture);
		dobleClickSprite.width = 0;
		dobleClickSprite.height = 0;
		dobleClickSprite.pivotX = 50;
		dobleClickSprite.pivotY = 50;
		this.addChild(dobleClickSprite);

		var greenTexture:Texture = Texture.fromColor(100, 100, 0xFF00FF00);

		clickSprite = new Image(greenTexture);
		clickSprite.width = 0;
		clickSprite.height = 0;
		clickSprite.pivotX = 50;
		clickSprite.pivotY = 50;
		this.addChild(clickSprite);

	}

	public function playClick():void {
		clickSprite.width = 100;
		clickSprite.height = 100;

		clickTween = new Tween(clickSprite, 0.5);
		clickTween.animate("scaleX", 0);
		clickTween.animate("scaleY", 0);
		Starling.juggler.add(clickTween);
	}

	public function playDoubleClick():void {
		dobleClickSprite.width = 100;
		dobleClickSprite.height = 100;

		doubleClickTween = new Tween(dobleClickSprite, 0.5);
		doubleClickTween.animate("scaleX", 0);
		doubleClickTween.animate("scaleY", 0);
		Starling.juggler.add(doubleClickTween);
	}
}
}
