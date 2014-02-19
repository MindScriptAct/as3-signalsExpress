package senders {
import flash.display.Shape;
import flash.display.Sprite;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import msa.signalsExpress.SignalExpress;


/**
 * COMMENT
 * @author rBanevicius
 */
public class ChildSender extends Sprite {
	private var label:String;
	
	public var clicked:SignalExpress
	= new SignalExpress(String);
	
	public function ChildSender(label:String, color:uint = 0xC0C0C0) {
		this.label = label;
		
		var circle:Shape = new Shape();
		circle.graphics.lineStyle(0.1, 0xFF0000);
		circle.graphics.beginFill(color);
		circle.graphics.drawCircle(50, 50, 60);
		circle.graphics.endFill();
		this.addChild(circle);
		
		var myTextField:TextField = new TextField();
		this.addChild(myTextField);
		myTextField.text = label
		myTextField.mouseEnabled = false;
		myTextField.autoSize = TextFieldAutoSize.LEFT;
		myTextField.x = 40;
		myTextField.y = 30;
		
		this.addEventListener(MouseEvent.CLICK, handleClick);
	}
	
	private function handleClick(event:MouseEvent):void {
		clicked.dispatch(label);
		event.stopPropagation();
	}
}
}