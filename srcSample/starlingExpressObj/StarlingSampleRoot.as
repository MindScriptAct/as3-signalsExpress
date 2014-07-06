package starlingExpressObj {
import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;

public class StarlingSampleRoot extends Sprite {

	var view:StarlingExpressObjView;

	public function StarlingSampleRoot() {

		view = new StarlingExpressObjView();
		this.addChild(view);
		view.x = 150;
		view.y = 150;
		view.doubleClickEnabled = true;
		view.signals.enterFrame.add(handlerEnterFrame);

		view.signals.click.add(handlerClick);
		view.signals.doubleClick.add(handleDoubleClick);

		view.signals.mouseOver.add(handleOver);
		view.signals.mouseOut.add(handleOut);

		view.signals.mouseUp.add(handleUp);
		view.signals.mouseDown.add(handleDown);

		view.signals.mouseMove.add(handleMove);

	}

	private function handlerEnterFrame(event:Event):void {
		//trace("enter frame..");
	}

	private function handlerClick(event:TouchEvent):void {
		trace("Click");
		view.rotation += Math.PI / 20;
	}

	private function handleDoubleClick(event:TouchEvent):void {
		trace("DoubleClick");
		view.rotation = 0;
	}

	private function handleOver(event:TouchEvent):void {
		trace("Over");
		view.alpha = 0.5;
	}

	private function handleOut(event:TouchEvent):void {
		trace("Out");
		view.alpha = 1;
	}

	private function handleUp(event:TouchEvent):void {
		trace("Up");
		view.scaleX = view.scaleY = 1;
	}

	private function handleDown(event:TouchEvent):void {
		trace("Down");
		view.scaleX = view.scaleY = 1.2;
	}

	private function handleMove(event:TouchEvent):void {
		trace("Move");
		view.x = 150 - 5 + Math.random() * 10;
		view.y = 150 - 5 + Math.random() * 10;
	}


}
}
