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
		
		var sender1:Sender = new Sender("A1:\nSimple signal", 0x80FF00);
		addChild(sender1);
		sender1.clicked.add(handleSingleSimpleClick);
		sender1.x = 50;
		sender1.y = 10;
		
		var sender2:Sender = new Sender("A2:\nOne shot signal", 0xFF8040);
		addChild(sender2);
		sender2.x = 400;
		sender2.y = 10
		sender2.clicked.add(handleSingleSimpleClick, true);
		
		var sender3:ParentSender = new ParentSender("B11:\nParent signal no bubbling", "B12:\nChild signal, no bubbling", 0x80FFFF, 0x9B9BFF, false);
		addChild(sender3);
		sender3.x = 60;
		sender3.y = 200;
		sender3.clicked.add(handleSimpleClick);
		
		var sender4:ParentSender = new ParentSender("B21:\nParent signal WITH bubbling", "B22:\nChild signal, WITH bubbling", 0x20B7FF, 0xFF91FF, true);
		addChild(sender4);
		sender4.x = 400;
		sender4.y = 200;
		sender4.clicked.add(handleSimpleClick);
		
		var sender5:Sender = new Sender("C1:\nBubble through unrelated object,\n listener added for C1 to react to C1 click", 0xD3A8FF);
		addChild(sender5);		
		sender5.x = 50;
		sender5.y = 400;
		
		sender5.clicked.add(handleSimpleClick);
		
		var sender6:Sender = new Sender("C2:\nBubble from unrelated object,\n listener added for C1 to react to C2 click", 0xFFA8FF);
		addChild(sender6);		
		sender6.x = 400;
		sender6.y = 400;		
	
		sender5.clicked.addBubblingFrom(sender6.clicked);
	}
	
	private function handleSimpleClick(param:String):void {
		trace("Main.handleClick from : ", param);
	}
	
	private function handleSingleSimpleClick(param:String):void {
		trace("Main.handleClick from : ", param);
	}

}

}