package testExpressObj {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class ExpressObjMain extends Sprite {

	private var view:SpriteExprView;

	public function ExpressObjMain() {

		view = new SpriteExprView();
		this.addChild(view);

		view.x = 150;
		view.y = 150;


		view.signals.click.add(handleClick);
		view.signals.click.add(handleClickOnce, true);

		view.signals.mouseOver.add(handleMouseOver);
		view.signals.mouseOut.add(handleMouseOut);

		view.signals.mouseDown.add(handleMouseDown);
		view.signals.mouseUp.add(handleMouseUp);

		view.signals.releaseOutside.add(handleMouseUp);

		view.signals.mouseMove.add(handleMouseMove);


		view.addEventListener(MouseEvent.CLICK, sholdNotHandle1);
		view.signals.click.remove(sholdNotHandle1);

		view.signals.click.add(sholdNotHandle2);
		view.removeEventListener(MouseEvent.CLICK, sholdNotHandle2);


	}

	private function handleMouseMove(event:MouseEvent):void {
		view.x = 150 - 5 + Math.random() * 10;
		view.y = 150 - 5 + Math.random() * 10;
	}

	private function handleMouseOver(event:MouseEvent):void {
		view.alpha = 0.5;
	}

	private function handleMouseOut(event:MouseEvent):void {
		view.alpha = 1;
	}

	private function handleMouseDown(event:MouseEvent):void {
		view.scaleX = view.scaleY = 1.2;
	}

	private function handleMouseUp(event:MouseEvent):void {
		view.scaleX = view.scaleY = 1;
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
		view.rotation += 45;
	}
}
}
