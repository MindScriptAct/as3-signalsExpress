/**
 * Created by Deril on 2014.06.22.
 */
package integration.helper {
public class TestHelper {

	private var _runCount:int = 0;
	private var _runCountSecond:int = 0;
	private var _runParamValue:String = "";

	// construct
	public function TestHelper() {
	}

	//---------------------
	// get functions
	//---------------------


	public function get runCount():int {
		return _runCount;
	}

	public function get runCountSecond():int {
		return _runCountSecond;
	}

	public function get runParamValue():String {
		return _runParamValue;
	}

	//---------------------
	// helper functions
	//---------------------

	public function callBack_no_params():void {
		_runCount++;
	}

	public function callBack_no_params_second():void {
		_runCountSecond++;
	}

	public function callBack_int_Param(paramTest:int):void {
		_runCount++;
		_runParamValue += String(paramTest);
	}

	public function callBack_str_Param(paramTest:String):void {
		_runCount++;
		_runParamValue += paramTest;
	}

	public function callBack_intStr_Params(param1:int, paramTest:String):void {
		_runCount++;
		_runParamValue += paramTest;
	}

	public function callBack_intStrIntStrInt_Params(param1:int, param2:String, param3:int, param4:String, param5:int):void {
		_runCount++;
		_runParamValue += param4;
	}


}
}
