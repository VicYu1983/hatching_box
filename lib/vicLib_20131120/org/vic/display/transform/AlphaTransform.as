package Vic.display.transform 
{
	import starling.display.DisplayObject;
	
	/**
	 * ...
	 * @author VicYu
	 */
	public class AlphaTransform extends Transform 
	{
		private var _alpha:Number;
		
		public function AlphaTransform(d:DisplayObject, time:int, alpha:Number, delay:int=0, method:String="squareRoot", callback:Function=null) 
		{
			super(d, time, delay, method, callback);
			_alpha = alpha;
		}
		
		override protected function process():void 
		{
			super.process();
			
			getDisplayObject().alpha += ( _alpha - getDisplayObject().alpha ) * getPercentValueByMethod();
		}
	}

}