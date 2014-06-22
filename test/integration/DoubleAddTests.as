package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * double add
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class DoubleAddTests {

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

	public function doubleAdd_noParams_ok():void {
		var signal:SignalExpress = new SignalExpress();
		var testFunction:Function = testObject.callBack_no_params;

		signal.add(testFunction);
		signal.add(testFunction);
		signal.dispatch();

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
	}

}
}