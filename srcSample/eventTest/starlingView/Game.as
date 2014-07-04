package eventTest.starlingView {

import starling.display.Sprite;

public class Game extends Sprite {

	private var redTestSprite:TestStarlingView = new TestStarlingView(0xAAFF0000, "RED:");
	private var greenTestSprite:TestStarlingView = new TestStarlingView(0xAA00FF00, "GRN:");
	private var blueTestSprite:TestStarlingView = new TestStarlingView(0xAA0000FF, "BLU:");

	public function Game() {

		addChild(redTestSprite);
		redTestSprite.x = 20 + 30;
		redTestSprite.y = 20;
		redTestSprite.rotation = Math.PI / 180 * 15;
		redTestSprite.doubleClickEnabled = true;

		redTestSprite.addChild(greenTestSprite);
		greenTestSprite.x = 50;
		greenTestSprite.y = 25;


		addChild(blueTestSprite);
		blueTestSprite.x = 20 + 30 + 50 - 25 - 20;
		blueTestSprite.y = 20 + 50 + 25 - 10;
		blueTestSprite.rotation = Math.PI / 180 * 15;

	}


}
}