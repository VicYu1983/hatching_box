package Vic.display.transform 
{
	import starling.display.DisplayObject;
	/**
	 * ...
	 * @author VicYu
	 */
	public class Transform 
	{
		private var _displayObject:DisplayObject;
		private var _time:int;
		private var _callback:Function;
		private var _passTime:int = 0;
		private var _method:String;
		private var _delay:int;
		private var _isRunning:Boolean = false;
		
		public function Transform( d:DisplayObject, time:int, delay:int = 0, method:String = "squareRoot", callback:Function = null ) 
		{
			_displayObject = d;
			_time = time;
			_delay = delay;
			_method = method;
			_callback = callback;
		}
		
		public function update():void {
			_passTime++;
			if ( !_isRunning )
			{
				if ( _passTime > _delay )
				{
					_passTime = 0;
					_isRunning = true;
				}
			}
			else
			{
				process();
				if ( _passTime >= _time )
				{
					_passTime = _time;
					if( _callback != null )
						_callback();
				}
			}
		}
		
		protected function process():void {
			//for children
		}
		
		protected function getDisplayObject():DisplayObject {
			return _displayObject;
		}
		
		protected function getPassTime():int {
			return _passTime;
		}
		
		protected function getTotalTime():int {
			return _time;
		}
		
		protected function getMethod():String {
			return _method;
		}
		
		protected function getPercentArithmetic():Number {
			return getPassTime() / getTotalTime();
		}
		
		protected function getPercentGeometric():Number {
			return getPercentArithmetic() * getPercentArithmetic();
		}
		
		protected function getPercentSquareRoot():Number {
			return Math.sqrt( getPercentArithmetic() );
		}
		
		protected function getPercentValueByMethod():Number {
			switch( getMethod() )
			{
				case TransformCategory.ARITHMETIC:
					return getPercentArithmetic();
				case TransformCategory.GEOMETRIC:
					return getPercentGeometric();
				case TransformCategory.SQUAREROOT:
					return getPercentSquareRoot();
				default:
					throw Error( "invalid methid" );
			}
		}
	}

}