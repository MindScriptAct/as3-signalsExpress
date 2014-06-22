package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * params not specified
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class DispatchNoParamsTests {

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

	public function noParamConfig_noParams_ok():void {
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_no_params);
		signal.dispatch();

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
	}

	[Test]

	public function noParamConfig_oneParam_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function noParamConfig_twoParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_intStr_Params);
		signal.dispatch(1, testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function noParamConfig_fiveParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_intStrIntStrInt_Params);
		signal.dispatch(1, "2", 3, testParam, 5);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

}
}