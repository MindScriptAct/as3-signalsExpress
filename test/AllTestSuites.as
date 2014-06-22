package {
import integration.*;

/**
 * COMMENT
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */

[Suite]
[RunWith("org.flexunit.runners.Suite")]

public class AllTestSuites {

	public var dispatchParamsTests:DispatchParamsTests;
	public var dispatchNoParamsTests:DispatchNoParamsTests;
	public var dispatchBadParamsTests:DispatchBadParamsTests;

	public var setParamClassesTests:SetParamClassesTests;
	public var bubbleTests:BubbleTests;
	public var handleOnceTests:HandleOnceTests;

	public var dubleDispatchTests:DoubleDispatchTests;
	public var doubleAddTests:DoubleAddTests;

	public var removeDispatchTests:RemoveDispatchTests;


}
}