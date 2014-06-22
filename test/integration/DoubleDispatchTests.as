package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * double dispatch
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class DoubleDispatchTests {

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

	public function doubleDispatch_noParams_ok():void {
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_no_params);
		signal.dispatch();
		signal.dispatch();

		Assert.assertEquals("Should be handled twice.", 2, testObject.runCount);
	}

	[Test]

	public function doubleDispatch_oneParam_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled twice.", 2, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam + testParam, testObject.runParamValue);
	}

	[Test]

	public function doubleDispatch_twoParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_intStr_Params);
		signal.dispatch(1, testParam);
		signal.dispatch(1, testParam);

		Assert.assertEquals("Should be handled twice.", 2, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam + testParam, testObject.runParamValue);
	}

	[Test]

	public function doubleDispatch_fiveParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_intStrIntStrInt_Params);
		signal.dispatch(1, "2", 3, testParam, 5);
		signal.dispatch(1, "2", 3, testParam, 5);

		Assert.assertEquals("Should be handled twice.", 2, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam + testParam, testObject.runParamValue);
	}


}
}