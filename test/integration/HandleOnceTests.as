package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * handle once option
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class HandleOnceTests {

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

	//--------------------

	[Test]

	public function singleDispatchHandling_noParams_ok():void {
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_no_params, true);
		signal.dispatch();
		signal.dispatch();

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
	}

	[Test]

	public function singleDispatchHandling_oneParam_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param, true);
		signal.dispatch(testParam);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function singleDispatchHandling_twoParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_intStr_Params, true);
		signal.dispatch(1, testParam);
		signal.dispatch(1, testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function singleDispatchHandling_fiveParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_intStrIntStrInt_Params, true);
		signal.dispatch(1, "2", 3, testParam, 5);
		signal.dispatch(1, "2", 3, testParam, 5);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

}
}