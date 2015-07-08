package Vic.display.transform 
{
	import starling.display.DisplayObject;
	
	/**
	 * ...
	 * @author VicYu
	 */
	public class MoveTransform extends Transform 
	{
		private var _x:Number;
		private var _y:Number;
		
		public function MoveTransform(d:DisplayObject, time:int, x:int, y:int, delay:int = 0, method:String = "squareRoot", callback:Function = null) 
		{
			super(d, time, delay, method, callback);
			
			_x = x;
			_y = y;
		}
		
		override protected function process():void 
		{
			super.process();
			
			getDisplayObject().x += ( _x - getDisplayObject().x ) * getPercentValueByMethod();
			getDisplayObject().y += ( _y - getDisplayObject().y ) * getPercentValueByMethod();
		}
	}

}