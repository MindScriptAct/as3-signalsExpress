package starlingExpressObj.flash {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class FlashSampleRoot extends Sprite {

	private var view:FlashObjView;

	public function FlashSampleRoot() {

		view = new FlashObjView();
		this.addChild(view);
		view.doubleClickEnabled = true;

		view.x = 350;
		view.y = 250;

		view.addEventListener(MouseEvent.CLICK, handlerClick);
		view.addEventListener(MouseEvent.DOUBLE_CLICK, handleDoubleClick);

		view.addEventListener(MouseEvent.MOUSE_OVER, handleOver);
		view.addEventListener(MouseEvent.MOUSE_OUT, handleOut);

		view.addEventListener(MouseEvent.RELEASE_OUTSIDE, handleReleaseOutside);

		view.addEventListener(MouseEvent.MOUSE_DOWN, handleDown);
		view.addEventListener(MouseEvent.MOUSE_UP, handleUp);

		view.addEventListener(MouseEvent.MOUSE_MOVE, handleMove);

	}


	private function handlerClick(event:MouseEvent):void {
		trace("Click");
		view.playClick();
	}

	private function handleDoubleClick(event:MouseEvent):void {
		trace("DoubleClick");
		view.playDoubleClick();
	}

	private function handleOver(event:MouseEvent):void {
		trace("Over");
		view.alpha = 0.5;
	}

	private function handleOut(event:MouseEvent):void {
		trace("Out");
		view.alpha = 1;
	}

	private function handleUp(event:MouseEvent):void {
		trace("Up");
		view.scaleX = view.scaleY = 1;
	}

	private function handleReleaseOutside(event:MouseEvent):void {
		trace("Release outside!");
		view.scaleX = view.scaleY = 1;
		view.alpha = 1;
	}

	private function handleDown(event:MouseEvent):void {
		trace("Down");
		view.scaleX = view.scaleY = 1.2;
	}

	private function handleMove(event:MouseEvent):void {
		//trace("Move");
		view.x = 350 - 5 + Math.random() * 10;
		view.y = 250 - 5 + Math.random() * 10;
	}
}
}
