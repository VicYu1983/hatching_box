package Vic.display.transform 
{
	import starling.display.DisplayObject;
	
	/**
	 * ...
	 * @author VicYu
	 */
	public class ScaleTransform extends Transform 
	{
		private var _scaleX:Number;
		private var _scaleY:Number;
		
		public function ScaleTransform(d:DisplayObject, time:int, scaleX:Number, scaleY:Number, delay:int = 0, method:String = "squareRoot", callback:Function = null) 
		{
			super(d, time, delay, method, callback);
			
			_scaleX = scaleX;
			_scaleY = scaleY;
		}
		
		override protected function process():void 
		{
			super.process();
			
			getDisplayObject().scaleX += ( _scaleX - getDisplayObject().scaleX ) * getPercentValueByMethod();
			getDisplayObject().scaleY += ( _scaleY - getDisplayObject().scaleY ) * getPercentValueByMethod();
		}
	}

}