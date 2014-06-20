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
public class ParentSender extends Sprite {
	private var label:String;
	
	public var clicked:SignalExpress = new SignalExpress(String);
	
	public function ParentSender(label:String,childLabel:String, color:uint = 0xC0C0C0, childColor:uint = 0x808080, bubbling:Boolean = false) {
		this.label = label;
		
		var circle:Shape = new Shape();
		circle.graphics.lineStyle(0.1, 0xFF0000);
		circle.graphics.beginFill(color);
		circle.graphics.drawCircle(25, 25, 100);
		circle.graphics.endFill();
		this.addChild(circle);
		
		var myTextField:TextField = new TextField();
		this.addChild(myTextField);
		myTextField.text = label
		myTextField.mouseEnabled = false;
		myTextField.autoSize = TextFieldAutoSize.LEFT;
		myTextField.x = -50;
		
		this.addEventListener(MouseEvent.CLICK, handleClick);
		
		var childSender:ChildSender = new ChildSender(childLabel, childColor);
		this.addChild(childSender);
		childSender.x = 40;
		childSender.y = 40;
		
		childSender.clicked.add(handleChildClick);
		
		if (bubbling) {
			clicked.addBubblingFrom(childSender.clicked);
		}
		
	}
	
	private function handleChildClick(childLabel:String):void {
		trace( "ParentSender.handleChildClick : " + childLabel );
	}
	
	private function handleClick(event:MouseEvent):void {
		clicked.dispatch(label);
	}
}
}