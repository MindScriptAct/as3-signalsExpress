package {
import com.gskinner.performance.AbstractTest;
import com.gskinner.performance.PerformanceTest;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.setTimeout;

import mindscriptact.flashSignals.signals.display.InteractiveObjectSignals;

import viewTests.SignalSpriteTest;
import viewTests.SpriteExpressTest;
import viewTests.SpriteTest;

[SWF(backgroundColor="0xEEEEEE", width="1200", height="900")]
public class PerformanceTests extends Sprite {

	private var output:TextField;
	private var performanceTest:PerformanceTest;

//	static private var ITERATION:int = 1;
//	static private var LOOP:int = 1;
	static private var ITERATION:int = 20;
	static private var LOOP:int = 50000;

	public function PerformanceTests() {
		output = new TextField();
		output.autoSize = TextFieldAutoSize.LEFT;
		this.addChild(output);

		output.width = this.stage.stageWidth;
		output.height = this.stage.stageHeight;

		output.text = 'Tests:';

		setTimeout(startTests, 1000);
	}

	private function handleMouseClick(event:MouseEvent):void {
		//trace("clicked...");
	}

	private function startTests():void {

		var spriteTest:SpriteTest = new SpriteTest();
		spriteTest.addEventListener(MouseEvent.CLICK, handleMouseClick);

		var signalSpriteTest:SignalSpriteTest = new SignalSpriteTest();
		signalSpriteTest.signals.click.add(handleMouseClick);

		var spriteExpressTest:SpriteExpressTest = new SpriteExpressTest();
		spriteExpressTest.signals.click.add(handleMouseClick);


		performanceTest = new PerformanceTest();
		performanceTest.queueSimpleTest(spriteTest.trigger, [],        "Event test:\t\t", ITERATION, LOOP);
		performanceTest.queueSimpleTest(signalSpriteTest.trigger, [],  "Signl test:\t\t", ITERATION, LOOP);
		performanceTest.queueSimpleTest(spriteExpressTest.trigger, [], "Expes test:\t\t", ITERATION, LOOP);


//		performanceTest.queueSimpleTest(orTest1, [], "or wise ass test: ", ITERATION * 3, LOOP * 3);
//		performanceTest.queueSimpleTest(orTest2, [], "or simple test: ", ITERATION * 3, LOOP * 3);
//		performanceTest.queueSimpleTest(orTest3, [], "or wise ass: ", ITERATION * 3, LOOP * 3);
//		performanceTest.queueSimpleTest(orTest4, [], "or simple: ", ITERATION * 3, LOOP * 3);

		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
	}


	private function handleTestComplete(event:Event):void {
		var curentTest:AbstractTest = (event.target as PerformanceTest).currentTest
		output.appendText("\n" + curentTest.name + curentTest.time + "                     " + curentTest);
	}

	private function orTest1():Object {
		var obj:Object;
		return obj ||= new InteractiveObjectSignals(null);
	}

	private function orTest2():Object {
		var obj:Object;
		if (!obj) {
			obj = new InteractiveObjectSignals(null);
		}
		return obj;
	}

	private function orTest3():void {
		var test:Object;
		var obj:Object;
		test = obj || Event;
	}

	private function orTest4():void {
		var test:Object;
		var obj:Object;
		if (!obj) {
			obj = Event
		}
		test = obj;
	}
}
}
