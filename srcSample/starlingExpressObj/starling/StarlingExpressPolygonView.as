package starlingExpressObj.starling {
import flash.geom.Point;

import mindscriptact.starlingSignals.display.SpriteStarlingExtendedExpress;

import starling.animation.Tween;
import starling.core.Starling;
import starling.display.DisplayObject;
import starling.display.Image;
import starling.textures.Texture;

public class StarlingExpressPolygonView extends SpriteStarlingExtendedExpress {

	private var testSprite:DisplayObject;
	private var clickSprite:Image;
	private var clickTween:Tween;
	private var dobleClickSprite:Image;
	private var doubleClickTween:Tween;

	public var baseX:int;
	public var baseY:int;

	// Embed the texture:
	[Embed(source="/assets/poligonPic.jpg")]
	public static const TestPic:Class;

	public function StarlingExpressPolygonView() {

		this.pivotX = 60;
		this.pivotY = 60;

		var violetTexture:Texture = Texture.fromBitmap(new TestPic());

		testSprite = new Image(violetTexture);
		this.addChild(testSprite);

		setHitPolygon(Vector.<Point>([//
			new Point(57, 30),//
			new Point(97, 62),//
			new Point(64, 100),//
			new Point(57, 70),//
			new Point(11, 64)//
		]));

	/*	setHitPolygon(Vector.<Point>([//
			new Point(0, 0),//
			new Point(0, 50),//
			new Point(50, 0)
		]));*/

		useDebugOverlay = true;


		var redTexture:Texture = Texture.fromColor(100, 100, 0xFFFF0000);

		dobleClickSprite = new Image(redTexture);
		dobleClickSprite.width = 0;
		dobleClickSprite.height = 0;
		this.addChild(dobleClickSprite);

		var greenTexture:Texture = Texture.fromColor(100, 100, 0xFF00FF00);

		clickSprite = new Image(greenTexture);
		clickSprite.width = 0;
		clickSprite.height = 0;
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
