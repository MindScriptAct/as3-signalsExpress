package starlingExpressObj {
import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;

public class StarlingRoot extends Sprite {
	public function StarlingRoot() {

		var testObj:StarlingExpressObjView = new StarlingExpressObjView();
		this.addChild(testObj);
		testObj.x = 50;
		testObj.y = 50;
		testObj.doubleClickEnabled = true;
		testObj.signals.enterFrame.add(handlerEnterFrame);

		testObj.signals.click.add(handlerClick);
		testObj.signals.doubleClick.add(handleDoubleClick);

		testObj.signals.mouseOver.add(handleOver);
		testObj.signals.mouseOut.add(handleOut);

		testObj.signals.mouseUp.add(handleUp);
		testObj.signals.mouseDown.add(handleDown);

		//testObj.signals.mouseMove.add(handleMove);

	}

	private function handlerEnterFrame(event:Event):void {
		//trace("enter frame..");
	}

	private function handlerClick(event:TouchEvent):void {
		trace("Click");
	}

	private function handleDoubleClick(event:TouchEvent):void {
		trace("DoubleClick");
	}

	private function handleOver(event:TouchEvent):void {
		trace("Over");
	}

	private function handleOut(event:TouchEvent):void {
		trace("Out");
	}

	private function handleUp(event:TouchEvent):void {
		trace("Up");
	}

	private function handleDown(event:TouchEvent):void {
		trace("Down");
	}

	private function handleMove(event:TouchEvent):void {
		trace("Move");
	}


}
}
