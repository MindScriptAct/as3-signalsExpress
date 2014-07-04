package eventTest {
import eventTest.starlingView.Game;
import eventTest.view.*;

import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.geom.Rectangle;
import flash.utils.getTimer;

import starling.core.Starling;

import eventTest.view.RectangleSprite;

[SWF(width="900", height="800", backgroundColor="#FFFFFF", frameRate="10")]
public class StarlingSimplifiedMain extends Sprite {
    private var redClickSource:RectangleSprite;
    private var greenClickSource:RectangleSprite;
    private var blueClickSource:RectangleSprite;
    private var _starling:Starling;


    public function StarlingSimplifiedMain() {


        _starling = new Starling(Game, stage, new Rectangle(0, 0, 250, 250));
        _starling.stage.color = 0xEEEEEE;
        _starling.start();

        redClickSource = new RectangleSprite(0xFF0000);
        redClickSource.doubleClickEnabled = true;
        addChild(redClickSource);
        redClickSource.x = 300;
        redClickSource.y = 200 - 20;
        addTestListeners(redClickSource, generalRedTrace);
        redClickSource.rotation = 15;
//        redClickSource.addEventListener(MouseEvent.CLICK, testClick);
//        redClickSource.addEventListener(MouseEvent.DOUBLE_CLICK, testDoubleClick);

        greenClickSource = new RectangleSprite(0x00FF00);
        redClickSource.doubleClickEnabled = true;
        redClickSource.addChild(greenClickSource);
        greenClickSource.x = 50;
        greenClickSource.y = 25;
        addTestListeners(greenClickSource, generalGreenTrace);

        blueClickSource = new RectangleSprite(0x0000FF);
        redClickSource.doubleClickEnabled = true;
        addChild(blueClickSource);
        blueClickSource.x = 300 + 50 - 25 - 20;
        blueClickSource.y = 200 - 20 + 50 + 25 - 10;
        addTestListeners(blueClickSource, generalBlueTrace);
        blueClickSource.rotation = 15;

//			clickSource.addEventListener(MouseEvent.CLICK, handleClick);
//			clickSource.addEventListener(MouseEvent.RIGHT_CLICK, handleMouseRightClick);
//			clickSource.addEventListener(MouseEvent.MIDDLE_CLICK, handleMiddleClick);
//			clickSource.addEventListener(MouseEvent.DOUBLE_CLICK, handleDoubleClick);
//
//			clickSource.addEventListener(MouseEvent.MOUSE_DOWN, handleMouseDown);
//			clickSource.addEventListener(MouseEvent.MOUSE_UP, handleMouseUp);
//			clickSource.addEventListener(MouseEvent.RELEASE_OUTSIDE, handleMouseReleaseOutside);
//
//			clickSource.addEventListener(MouseEvent.MOUSE_OVER, handleMouseOver);
//			clickSource.addEventListener(MouseEvent.MOUSE_OUT, handleMouseOUT);
//
//			clickSource.addEventListener(MouseEvent.ROLL_OVER, handleMouseRollOver);
//			clickSource.addEventListener(MouseEvent.ROLL_OUT, handleMouseRollOut);
//
//			clickSource.addEventListener(MouseEvent.MOUSE_WHEEL, handleMouseWheel);
//			clickSource.addEventListener(MouseEvent.CONTEXT_MENU, handleMouseContextMenu);


    }

    private var minForClick:int = int.MAX_VALUE;
    private var maxForDoubleClick:int = int.MIN_VALUE;

    private var lastClick:int;


    private function testDoubleClick(event:MouseEvent):void {
        var time:int = getTimer();
        var clickSpace:int = time - lastClick;
        if (maxForDoubleClick < clickSpace) {
            maxForDoubleClick = clickSpace;
        }
        trace("Double!:", maxForDoubleClick, minForClick, clickSpace);
        lastClick = 0;
    }

    private function testClick(event:MouseEvent):void {
        var time:int = getTimer();
        var clickSpace:int = time - lastClick;
        if (minForClick > clickSpace) {
            minForClick = clickSpace;
        }
        trace("Click..:", maxForDoubleClick, minForClick, clickSpace);
        lastClick = time;
    }

    private function addTestListeners(clickSource:RectangleSprite, generalTrace:Function):void {
        clickSource.addEventListener(MouseEvent.CLICK, generalTrace);
        clickSource.addEventListener(MouseEvent.RIGHT_CLICK, generalTrace);
        clickSource.addEventListener(MouseEvent.MIDDLE_CLICK, generalTrace);
        clickSource.addEventListener(MouseEvent.DOUBLE_CLICK, generalTrace);

        clickSource.addEventListener(MouseEvent.MOUSE_DOWN, generalTrace);
        clickSource.addEventListener(MouseEvent.MOUSE_UP, generalTrace);

        clickSource.addEventListener(MouseEvent.MIDDLE_MOUSE_DOWN, generalTrace);
        clickSource.addEventListener(MouseEvent.MIDDLE_MOUSE_UP, generalTrace);

        clickSource.addEventListener(MouseEvent.RIGHT_MOUSE_DOWN, generalTrace);
        clickSource.addEventListener(MouseEvent.RIGHT_MOUSE_UP, generalTrace);

        clickSource.addEventListener(MouseEvent.RELEASE_OUTSIDE, generalTrace);

        clickSource.addEventListener(MouseEvent.MOUSE_OVER, generalTrace);
        clickSource.addEventListener(MouseEvent.MOUSE_OUT, generalTrace);

        clickSource.addEventListener(MouseEvent.ROLL_OVER, generalTrace);
        clickSource.addEventListener(MouseEvent.ROLL_OUT, generalTrace);

        clickSource.addEventListener(MouseEvent.MOUSE_WHEEL, generalTrace);
        clickSource.addEventListener(MouseEvent.CONTEXT_MENU, generalTrace);

        clickSource.addEventListener(MouseEvent.MOUSE_MOVE, generalTrace);
    }

    private function generalRedTrace(event:MouseEvent):void {
        trace("RED:", event.type);
    }

    private function generalBlueTrace(event:MouseEvent):void {
        trace("BLU:", event.type);
    }

    private function generalGreenTrace(event:MouseEvent):void {
        trace("GRN:", event.type);
    }

    ////////////////////////////

    private function handleClick(event:MouseEvent):void {
    }

    private function handleMouseRightClick(event:MouseEvent):void {
    }

    private function handleMiddleClick(event:MouseEvent):void {
    }

    private function handleDoubleClick(event:MouseEvent):void {
    }

    private function handleMouseDown(event:MouseEvent):void {
    }

    private function handleMouseUp(event:MouseEvent):void {
    }

    private function handleMouseReleaseOutside(event:MouseEvent):void {
    }

    private function handleMouseOver(event:MouseEvent):void {
    }

    private function handleMouseOUT(event:MouseEvent):void {
    }

    private function handleMouseRollOver(event:MouseEvent):void {

    }

    private function handleMouseRollOut(event:MouseEvent):void {

    }

    private function handleMouseWheel(event:MouseEvent):void {

    }

    private function handleMouseContextMenu(event:MouseEvent):void {

    }
}
}
