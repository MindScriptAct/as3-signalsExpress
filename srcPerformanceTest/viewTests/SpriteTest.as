/**
 * Created by Deril on 2014.06.24.
 */
package viewTests {
import flash.display.Sprite;
import flash.events.MouseEvent;

import mindscriptact.signalsExpress.SignalExpress;

import org.osflash.signals.Signal;

public class SpriteTest extends Sprite {

	public var testSignal:Signal = new Signal();

	public var testSignalExpress:SignalExpress = new SignalExpress();

	public function SpriteTest() {
	}

	public function trigger():void {
		dispatchEvent(new MouseEvent(MouseEvent.CLICK));
	}

	///

	public function triggerEvent():void {
		dispatchEvent(new TestEvent(TestEvent.TEST));
	}

	public function triggerSignal():void {
		testSignal.dispatch();
	}

	public function triggerSignalExpress():void {
		testSignalExpress.dispatch();
	}
}
}
