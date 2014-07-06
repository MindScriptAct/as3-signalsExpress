package testExpressObj {
import mindscriptact.flashSignals.display.SpriteExpress;

public class SpriteExprView extends SpriteExpress {

	public function SpriteExprView() {
		this.graphics.beginFill(0xFFFF00FF);
		this.graphics.drawRect(-50, -50, 100, 100);
		this.graphics.endFill();
	}
}
}
