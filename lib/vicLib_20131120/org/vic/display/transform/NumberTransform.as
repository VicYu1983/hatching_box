package Vic.display.transform 
{
	import starling.display.DisplayObject;
	import starling.text.TextField;
	
	/**
	 * ...
	 * @author VicYu
	 */
	public class NumberTransform extends Transform 
	{
		private var _targetValue:int;
		
		public function NumberTransform(d:DisplayObject, time:int, targetValue:int, delay:int=0, method:String="squareRoot", callback:Function=null) 
		{
			super(d, time, delay, method, callback);
			
			_targetValue = targetValue;
		}
		
		override protected function process():void 
		{
			super.process();
			
			var targetField:TextField = getDisplayObject() as TextField;
			var oldNumber:int = int( targetField.text );
			oldNumber += ( _targetValue - oldNumber ) * getPercentValueByMethod();
			targetField.text = oldNumber.toString();
		}
		
	}

}