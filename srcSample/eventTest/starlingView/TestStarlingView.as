package eventTest.starlingView {
import flash.events.MouseEvent;
import flash.utils.getTimer;

import starling.display.Image;
import starling.display.Sprite;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.textures.Texture;

public class TestStarlingView extends Sprite {
    private var itemName:String;
    private var testSprite:Image;

    private var isMouseOver:Boolean;

    public var doubleClickEnabled:Boolean;

    private const DOUBLE_CLICK_TIME:int = 500;
    private var lastClick:int = int.MIN_VALUE;


    public function TestStarlingView(color:int, itemName:String) {
        super();
        this.itemName = itemName;

        var texture:Texture = Texture.fromColor(100, 100, color)
        testSprite = new Image(texture);
        this.addChild(testSprite);

        testSprite.addEventListener(TouchEvent.TOUCH, handleTouch);


    }


    private function handleTouch(event:TouchEvent):void {
        var touch:Touch = event.getTouch(testSprite);
        var touches:Vector.<Touch> = event.getTouches(testSprite);
        if (touch) {
            trace(itemName, touch.phase, "          ", touches);

            switch (touch.phase) {
                case TouchPhase.HOVER:
                    if (!isMouseOver) {
                        isMouseOver = true;
                        trace(itemName, "MouseEvent." + MouseEvent.MOUSE_OVER);
                    }
                    trace(itemName, "MouseEvent." + MouseEvent.MOUSE_MOVE);
                    break;
                case TouchPhase.BEGAN:
                    trace(itemName, "MouseEvent." + MouseEvent.MOUSE_DOWN);
                    break;
                case TouchPhase.ENDED:
                    trace(itemName, "MouseEvent." + MouseEvent.MOUSE_UP);
                    if (doubleClickEnabled) {
                        var time:int = getTimer();
                        if (time - lastClick < DOUBLE_CLICK_TIME) {
                            trace(itemName, "MouseEvent." + MouseEvent.DOUBLE_CLICK);
                        } else {
                            trace(itemName, "MouseEvent." + MouseEvent.CLICK);
                            lastClick = time;
                        }

                    } else {
                        trace(itemName, "MouseEvent." + MouseEvent.CLICK);
                    }
                    break;
                case TouchPhase.MOVED:
                    //trace(itemName, "drag???");
                    trace(itemName, "MouseEvent." + MouseEvent.MOUSE_MOVE);
                    break;
                case TouchPhase.STATIONARY:
                    trace(itemName, "What??? it stands?");
                    break;
            }
        } else {
            if (isMouseOver) {
                isMouseOver = false;
                trace(itemName, "MouseEvent." + MouseEvent.MOUSE_OUT);
            }
        }
    }


    override public function dispose():void {
        super.dispose();
    }
}
}
