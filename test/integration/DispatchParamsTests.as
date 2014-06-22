package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * params specified
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class DispatchParamsTests {

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

	public function paramConfig_oneParam_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress(String);

		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function paramConfig_twoParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress(int, String);

		signal.add(testObject.callBack_intStr_Params);
		signal.dispatch(1, testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function paramConfig_fiveParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress(int, String, int, String, int);

		signal.add(testObject.callBack_intStrIntStrInt_Params);
		signal.dispatch(1, "2", 3, testParam, 5);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

}
}