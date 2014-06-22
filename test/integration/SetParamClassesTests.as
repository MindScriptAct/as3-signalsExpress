package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * setting params test
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class SetParamClassesTests {

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

	public function setParamClasses_nullDefaults_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.paramClasses = null;
		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function setParamClasses_emptyArray_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.paramClasses = [];
		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function setParamClasses_oneParam_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.paramClasses = [String];
		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function setParamClasses_twoParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.paramClasses = [int, String];
		signal.add(testObject.callBack_intStr_Params);
		signal.dispatch(1, testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

	[Test]

	public function setParamClasses_fiveParams_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.paramClasses = [int, String, int, String, int];
		signal.add(testObject.callBack_intStrIntStrInt_Params);
		signal.dispatch(1, "2", 3, testParam, 5);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}

}
}