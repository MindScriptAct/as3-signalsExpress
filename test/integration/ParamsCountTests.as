package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * params specified
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class ParamsCountTests {

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

	public function paramCount_noParam_ok():void {
		var signal:SignalExpress = new SignalExpress();

		Assert.assertEquals("Callback count does not match.", 0, signal.paramCount);
	}

	[Test]

	public function paramCount_oneParam_ok():void {
		var signal:SignalExpress = new SignalExpress(String);

		Assert.assertEquals("Callback count does not match.", 1, signal.paramCount);
	}

	[Test]

	public function paramCount_twoParams_ok():void {
		var signal:SignalExpress = new SignalExpress(int, String);

		Assert.assertEquals("Callback count does not match.", 2, signal.paramCount);
	}

	[Test]

	public function paramCount_fiveParams_ok():void {
		var signal:SignalExpress = new SignalExpress(int, String, int, String, int);

		Assert.assertEquals("Callback count does not match.", 5, signal.paramCount);
	}

	[Test]

	public function paramCount_set_noParams_ok():void {
		var signal:SignalExpress = new SignalExpress();
		signal.paramClasses = [];

		Assert.assertEquals("Callback count does not match.", 0, signal.paramCount);
	}

	public function paramCount_set_twoParams_ok():void {
		var signal:SignalExpress = new SignalExpress();
		signal.paramClasses = [int, String];

		Assert.assertEquals("Callback count does not match.", 2, signal.paramCount);
	}

	public function paramCount_set_fiveParams_ok():void {
		var signal:SignalExpress = new SignalExpress();
		signal.paramClasses = [int, String, int, String, int];

		Assert.assertEquals("Callback count does not match.", 5, signal.paramCount);
	}

}
}