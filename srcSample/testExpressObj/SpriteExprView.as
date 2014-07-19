package testExpressObj {
import mindscriptact.flashSignals.display.SpriteExpress;


[SWF(backgroundColor="0xEEEEEE", width="800", height="600")]
public class SpriteExprView extends SpriteExpress {

	public function SpriteExprView() {
		this.graphics.beginFill(0x123456);
		this.graphics.drawRect(50, 50, 100, 100);
		this.graphics.endFill();
	}
}
}
