package Vic.display.transform 
{
	import starling.display.DisplayObject;
	/**
	 * ...
	 * @author VicYu
	 */
	public class Vibration 
	{
		private var _view:DisplayObject; 
		private var _life:int = 0;
		private var _callback:Function;
		private var _oriX:int;
		private var _oriY:int;
		
		public var affectTime:int;
		public var rangeX:int;
		public var rangeY:int;
		
		public function Vibration( v:DisplayObject, affectTime:int = 5, rangeX:int = 3, rangeY:int = 3, callback:Function = null) 
		{
			_view = v;
			_callback = callback;
			_oriX = _view.x;
			_oriY = _view.y;
			
			this.affectTime = affectTime;
			this.rangeX = rangeX;
			this.rangeY = rangeY;
		}
		
		public function reset():void {
			_life = 0;
		}
		
		public function update():void {
			var rx:int = Math.random() * rangeX - rangeX / 2;
			var ry:int = Math.random() * rangeY - rangeY / 2;
			_view.x += rx;
			_view.y += ry;
			
			_life++;
			if ( _life >= affectTime )
			{
				_view.x = _oriX;
				_view.y = _oriY;
				_view = null;
				if ( _callback != null )
				{
					_callback();
				}
			}
		}
	}

}