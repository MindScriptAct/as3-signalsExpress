package starlingExpressObj {
import mindscriptact.starlingSignals.display.SpriteStarlingExpress;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.textures.Texture;

public class StarlingExpressObjView extends SpriteStarlingExpress {

	private var testSprite:DisplayObject;

	public function StarlingExpressObjView() {

		var texture:Texture = Texture.fromColor(100, 100, 0xFFFF0000);
		testSprite = new Image(texture);
		this.addChild(testSprite);

	}
}
}