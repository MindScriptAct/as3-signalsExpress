package testExpressObj {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class ExpressObjMain extends Sprite {

	public function ExpressObjMain() {

		var view:SpriteExprView = new SpriteExprView();
		this.addChild(view);


		view.signals.click.add(handleClick);
		view.signals.click.add(handleClickOnce, true);

		view.addEventListener(MouseEvent.CLICK, sholdNotHandle1);
		view.signals.click.remove(sholdNotHandle1);

		view.signals.click.add(sholdNotHandle2);
		view.removeEventListener(MouseEvent.CLICK, sholdNotHandle2);


	}

	private function sholdNotHandle1(event:MouseEvent):void {
		trace("SHOLD BE REMOVED 1!");
	}

	private function sholdNotHandle2(event:MouseEvent):void {
		trace("SHOLD BE REMOVED 2!");
	}


	private function handleClickOnce(event:MouseEvent):void {
		trace("Click once!");
	}

	private function handleClick(event:MouseEvent):void {
		trace("Click!");
	}
}
}
