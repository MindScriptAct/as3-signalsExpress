package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * bubbling
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class BubbleTests {

	private var testObject:TestHelper;

	[Before]

	public function runBeforeEveryTest():void {
		testObject = new TestHelper();
	}

	[After]

	public function runAfterEveryTest():void {
		testObject = null;
	}

	//--------------------

	[Test]

	public function bubble_basic_ok():void {

		var signal:SignalExpress = new SignalExpress();
		signal.add(testObject.callBack_no_params);

		var signalChild:SignalExpress = new SignalExpress();
		signalChild.add(testObject.callBack_no_params_second);

		signalChild.addBubblingFrom(signal);

		signal.dispatch();

		Assert.assertEquals("Base should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Child should be handled once.", 1, testObject.runCountSecond);
	}

	[Test]

	public function bubble_doubleChildHandling_ok():void {

		var signal:SignalExpress = new SignalExpress();
		signal.add(testObject.callBack_no_params);

		var signalChild:SignalExpress = new SignalExpress();
		signalChild.add(testObject.callBack_no_params_second);

		signalChild.addBubblingFrom(signal);

		signal.dispatch();
		signalChild.dispatch();

		Assert.assertEquals("Base should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Child should be handled twice.", 2, testObject.runCountSecond);
	}

	[Test]

	public function bubble_hasBubble_ok():void {

		var signal:SignalExpress = new SignalExpress();
		signal.add(testObject.callBack_no_params);

		var signalChild:SignalExpress = new SignalExpress();
		signalChild.add(testObject.callBack_no_params_second);

		signalChild.addBubblingFrom(signal);

		Assert.assertTrue("Should have bubbling!", signalChild.hasBubblingFrom(signal));
	}

	[Test]

	public function bubble_hasNoBubble_ok():void {

		var signal:SignalExpress = new SignalExpress();
		signal.add(testObject.callBack_no_params);

		var signalChild:SignalExpress = new SignalExpress();
		signalChild.add(testObject.callBack_no_params_second);

		Assert.assertFalse("Should not have bubbling.", signalChild.hasBubblingFrom(signal));
	}

}
}