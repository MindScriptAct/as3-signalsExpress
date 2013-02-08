package {
import flash.display.Sprite;
import flash.events.Event;
import senders.ParentSender;
import senders.Sender;

/**
 * ...
 * @author rBanevicius
 */
public class Main extends Sprite {
	
	public function Main():void {
		if (stage)
			init();
		else
			addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(e:Event = null):void {
		removeEventListener(Event.ADDED_TO_STAGE, init);
		// entry point
		
		var sender1:Sender = new Sender("Simple signal", 0x80FF00);
		addChild(sender1);
		sender1.clicked.add(handleSingleSimpleClick);
		
		var sender2:Sender = new Sender("One shot signal", 0xFF8040);
		addChild(sender2);
		sender2.x = 400;
		sender2.clicked.add(handleSingleSimpleClick, true);
		
		var sender3:ParentSender = new ParentSender("Parent signal no bubbling", "Child signal, no bubbling", 0x80FFFF, 0x9B9BFF, false);
		addChild(sender3);
		sender3.clicked.add(handleSimpleClick);
		sender3.y = 300;
		sender3.x = 60;
		
		var sender4:ParentSender = new ParentSender("Parent signal WITH bubbling", "Child signal, WITH bubbling", 0x20B7FF, 0xFF91FF, true);
		addChild(sender4);
		sender4.clicked.add(handleSimpleClick);
		sender4.y = 300;
		sender4.x = 400;
	
	}
	
	private function handleSimpleClick(param:String):void {
		trace("Main.handleClick from : ", param);
	}
	
	private function handleSingleSimpleClick(param:String):void {
		trace("Main.handleClick from : ", param);
	}

}

}