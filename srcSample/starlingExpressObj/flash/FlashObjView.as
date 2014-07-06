package starlingExpressObj.flash {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.Event;

public class FlashObjView extends Sprite {

	private var clickView:Shape;
	private var doubleClickView:Shape;

	public function FlashObjView() {

		this.graphics.beginFill(0xFF00FF);
		this.graphics.drawRect(-50, -50, 100, 100);
		this.graphics.endFill();


		doubleClickView = new Shape();
		doubleClickView.graphics.beginFill(0xFF0000);
		doubleClickView.graphics.drawRect(-50, -50, 100, 100);
		doubleClickView.graphics.endFill();
		this.addChild(doubleClickView);
		doubleClickView.scaleX = doubleClickView.scaleY = 0;

		clickView = new Shape();
		clickView.graphics.beginFill(0x00FF00);
		clickView.graphics.drawRect(-50, -50, 100, 100);
		clickView.graphics.endFill();
		this.addChild(clickView);
		clickView.scaleX = clickView.scaleY = 0;

		this.addEventListener(Event.ENTER_FRAME, handleEnterFrame);
	}

	private function handleEnterFrame(event:Event):void {
		if (clickView.scaleX > 0.01) {
			clickView.scaleX = clickView.scaleX * 0.8;
			clickView.scaleY = clickView.scaleY * 0.8;
		} else {
			clickView.scaleX = clickView.scaleY = 0;
		}
		if (doubleClickView.scaleX > 0.01) {
			doubleClickView.scaleX = doubleClickView.scaleX * 0.8;
			doubleClickView.scaleY = doubleClickView.scaleY * 0.8;
		} else {
			doubleClickView.scaleX = doubleClickView.scaleY = 0;
		}
	}

	public function playClick():void {
		clickView.scaleX = clickView.scaleY = 1;
	}

	public function playDoubleClick():void {
		doubleClickView.scaleX = doubleClickView.scaleY = 1;
	}
}
}
