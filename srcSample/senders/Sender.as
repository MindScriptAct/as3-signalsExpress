package senders {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import mindscriptact.signalsExpress.SignalExpress;

/**
 * COMMENT
 * @author rBanevicius
 */
public class Sender extends Sprite {
	private var label:String;
	
	public var clicked:SignalExpress;
	
	public function Sender(label:String, color:uint = 0xC0C0C0) {
		
		clicked = new SignalExpress();
		clicked.paramClasses = [String];
		
		this.label = label;
		
		var rectangle:Shape = new Shape();
		rectangle.graphics.lineStyle(0.1, 0x000000);
		rectangle.graphics.beginFill(color);
		rectangle.graphics.drawRect(0, 0, 230, 100);
		rectangle.graphics.endFill();
		this.addChild(rectangle);
		
		var myTextField:TextField = new TextField();
		this.addChild(myTextField);
		myTextField.text = label
		myTextField.mouseEnabled = false;
		myTextField.autoSize = TextFieldAutoSize.LEFT;
		
		this.addEventListener(MouseEvent.CLICK, handleClick);
	}
	
	private function handleClick(event:MouseEvent):void {
		clicked.dispatch(label);
	}

}
}