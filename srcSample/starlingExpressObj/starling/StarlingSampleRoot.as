package starlingExpressObj.starling {
import mindscriptact.starlingSignals.display.SpriteStarlingExpress;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.TouchEvent;

public class StarlingSampleRoot extends Sprite {

	public function StarlingSampleRoot() {

		var view:StarlingExpressObjView = new StarlingExpressObjView();
		this.addChild(view);
		view.x = view.baseX = 150;
		view.y = view.baseY = 150;
		addSignals(view);

		var viewCircle:StarlingExpressCircleView = new StarlingExpressCircleView();
		this.addChild(viewCircle);
		viewCircle.x = viewCircle.baseX = 600;
		viewCircle.y = viewCircle.baseY = 100;
		addSignals(viewCircle);

		var viewRect:StarlingExpressRectangleView = new StarlingExpressRectangleView();
		this.addChild(viewRect);
		viewRect.x = viewRect.baseX = 600;
		viewRect.y = viewRect.baseY = 300;
		addSignals(viewRect);

		var viewPoli:StarlingExpressPolygonView = new StarlingExpressPolygonView();
		this.addChild(viewPoli);
		viewPoli.x = viewPoli.baseX = 600;
		viewPoli.y = viewPoli.baseY = 500;
		addSignals(viewPoli);

	}

	private function addSignals(view:SpriteStarlingExpress):void {
		view.doubleClickEnabled = true;
		//view.signals.enterFrame.add(handlerEnterFrame);

		view.signals.click.add(handlerClick);
		view.signals.doubleClick.add(handleDoubleClick);

		view.signals.mouseOver.add(handleOver);
		view.signals.mouseOut.add(handleOut);


		view.signals.releaseOutside.add(handleReleaseOutside);

		view.signals.mouseUp.add(handleUp);
		view.signals.mouseDown.add(handleDown);

		view.signals.mouseMove.add(handleMove);
	}

	private function handlerEnterFrame(event:Event):void {
		//trace("enter frame..");
	}

	private function handlerClick(event:TouchEvent):void {
		trace("Click");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.playClick();
	}

	private function handleDoubleClick(event:TouchEvent):void {
		trace("DoubleClick");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.playDoubleClick();
	}

	private function handleOver(event:TouchEvent):void {
		trace("Over");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.alpha = 0.5;
	}

	private function handleOut(event:TouchEvent):void {
		trace("Out");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.alpha = 1;
	}

	private function handleUp(event:TouchEvent):void {
		trace("Up");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.scaleX = view.scaleY = 1;
	}

	private function handleReleaseOutside(event:TouchEvent):void {
		trace("Release outside!");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.scaleX = view.scaleY = 1;
		view.alpha = 1;
	}

	private function handleDown(event:TouchEvent):void {
		trace("Down");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.scaleX = view.scaleY = 1.2;
	}

	private function handleMove(event:TouchEvent):void {
		//trace("Move");
		var view:Object = (event.target as DisplayObject);
		if (view is Image) {
			view = view.parent;
		}
		view.x = view.baseX - 5 + Math.random() * 10;
		view.y = view.baseY - 5 + Math.random() * 10;
	}


}
}
