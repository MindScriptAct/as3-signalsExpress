package {
import com.gskinner.performance.AbstractTest;
import com.gskinner.performance.PerformanceTest;

import flash.display.Sprite;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.TextField;
import flash.text.TextFieldAutoSize;
import flash.utils.setTimeout;

import viewTests.SignalSpriteTest;
import viewTests.SpriteExpressTest;
import viewTests.SpriteTest;
import viewTests.TestEvent;

[SWF(backgroundColor="0xEEEEEE", width="800", height="600")]
public class PerformanceTests extends Sprite {

	private static const EVENT_TEST:String = "event test:  \t\t";
	private static const SIGNAL_TEST:String = "signal test:  \t\t";
	private static const SIGNAL_EXPRESS_TEST:String = "signalExpress test:  \t\t";
	private static const CLICK_EVENT_TEST:String = "Click event test:  \t\t";
	private static const CLICK_EVENT_USING_SIGNAL:String = "Click event using signal: \t\t";
	private static const CLICK_EVENT_USING_SIGNAL_EXPRESS:String = "Click event using signalExpress:\t\t";

	private var eventSpeed:Number;
	private var signalSpeed:Number;
	private var signalExpressSpeed:Number;


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

		output.text = "Tests:\n";

		setTimeout(startTests, 1000);
	}


	private function startTests():void {

		var spriteTest:SpriteTest = new SpriteTest();
		spriteTest.addEventListener(MouseEvent.CLICK, handleMouseClick);

		spriteTest.addEventListener(TestEvent.TEST, handleTestEvent);
		spriteTest.testSignal.add(handleTestSignal);
		spriteTest.testSignalExpress.add(handleTestSignalExpress);

		var signalSpriteTest:SignalSpriteTest = new SignalSpriteTest();
		signalSpriteTest.signals.click.add(handleMouseClick);

		var spriteExpressTest:SpriteExpressTest = new SpriteExpressTest();
		spriteExpressTest.signals.click.add(handleMouseClick);


		performanceTest = new PerformanceTest();
		performanceTest.queueSimpleTest(spriteTest.triggerEvent, [], EVENT_TEST, ITERATION, LOOP);
		performanceTest.queueSimpleTest(spriteTest.triggerSignal, [], SIGNAL_TEST, ITERATION, LOOP);
		performanceTest.queueSimpleTest(spriteTest.triggerSignalExpress, [], SIGNAL_EXPRESS_TEST, ITERATION, LOOP);
		performanceTest.queueSimpleTest(spriteTest.trigger, [], CLICK_EVENT_TEST, ITERATION, LOOP);
		performanceTest.queueSimpleTest(signalSpriteTest.trigger, [], CLICK_EVENT_USING_SIGNAL, ITERATION, LOOP);
		performanceTest.queueSimpleTest(spriteExpressTest.trigger, [], CLICK_EVENT_USING_SIGNAL_EXPRESS, ITERATION, LOOP);

		performanceTest.addEventListener(Event.COMPLETE, handleTestComplete);
	}

	private function handleTestEvent(event:TestEvent):void {
		// do nothing.
	}

	private function handleTestSignal():void {
		// do nothing.
	}

	private function handleTestSignalExpress():void {
		// do nothing.
	}


	private function handleMouseClick(event:MouseEvent):void {
		//trace("clicked...");
	}


	private function handleTestComplete(event:Event):void {
		var curentTest:AbstractTest = (event.target as PerformanceTest).currentTest
		output.appendText("\n" + curentTest.name + curentTest.time + "                     " + curentTest);

		switch (curentTest.name) {
			case EVENT_TEST:
				eventSpeed = curentTest.time;
				break;
			case SIGNAL_TEST:
				signalSpeed = curentTest.time;
				break;
			case SIGNAL_EXPRESS_TEST:
				signalExpressSpeed = curentTest.time;
				output.appendText("\n");
				output.appendText("\n\tevent > signal : " + int(((eventSpeed / signalSpeed) * 100) - 100) + "%");
				output.appendText("\n\tevent > signalExpress : " + int(((eventSpeed / signalExpressSpeed) * 100) - 100) + "%");
				output.appendText("\n\tsignal > signalExpress : " + int(((signalSpeed / signalExpressSpeed) * 100) - 100) + "%");
				output.appendText("\n");
				break;
			case CLICK_EVENT_TEST:
				eventSpeed = curentTest.time;
				break;
			case CLICK_EVENT_USING_SIGNAL:
				signalSpeed = curentTest.time;
				break;
			case CLICK_EVENT_USING_SIGNAL_EXPRESS:
				signalExpressSpeed = curentTest.time;
				output.appendText("\n");
				output.appendText("\n\tclick event > signal : " + int(((eventSpeed / signalSpeed) * 100) - 100) + "%");
				output.appendText("\n\tclick event > signalExpress : " + int(((eventSpeed / signalExpressSpeed) * 100) - 100) + "%");
				output.appendText("\n\tclick signal > signalExpress : " + int(((signalSpeed / signalExpressSpeed) * 100) - 100) + "%");
				output.appendText("\n");

				output.appendText("\nDone.");
				break;

		}

	}

}
}
