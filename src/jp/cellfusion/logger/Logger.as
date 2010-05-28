package jp.cellfusion.logger 
{

	/**
	 * @author cellfusion
	 * 
	 * Logger ライブラリ
	 * initialize 時に出力するレベルを設定します。
	 * デフォルトは info まで出力。
	 * 
	 * trace と SOS Max へ出力します。
	 * flex では trace が消せないので Logger.initialize(Logger.LEVEL_NONE); を指定して出力しないように出来ます。
	 * 
	 * SOS Max
	 * http://www.sos.powerflasher.com/developer-tools/sosmax/home/
	 */
	public class Logger 
	{
		public static const LEVEL_NONE:uint = 0;
		public static const LEVEL_TRACE:uint = 1;
		public static const LEVEL_DEBUG:uint = 2;
		public static const LEVEL_INFO:uint = 3;
		public static const LEVEL_WARNING:uint = 4;
		public static const LEVEL_ERROR:uint = 5;
		public static const LEVEL_FATAL:uint = 6;
		private static var _level:uint;
		private static var _ready:Boolean = false;
		private static var _keys:Array;
		private static var _loggers:Array;

		/**
		 * @param level 出力レベル
		 * 
		 * 出力するレベルを選択
		 * 一度実行すると後からは変更できないのできないので、読み込み元では LEVEL_NONE を指定して常に出力が出ないようにすることも可能。
		 */
		public static function initialize(level:uint = LEVEL_INFO):void 
		{
			if (_ready) return;
			
			if (level == Logger.LEVEL_NONE) {
				_ready = true;
				return;
			}
			_level = level;
			_keys = ['none', 'trace', 'debug', 'info', 'warning', 'error', 'fatal'];
			
			_loggers = [];
			
			// 指定してある Logger だけ作成
			_loggers.push(new SOSLogger());
			_loggers.push(new TraceLogger());
			
			_ready = true;
		}
		
		/**
		 * 
		 */
		public static function trace(message:String):void 
		{
			log(message, LEVEL_TRACE);
		}
		
		/**
		 * 
		 */
		public static function debug(message:String):void 
		{
			log(message, LEVEL_DEBUG);
		}
		
		/**
		 * 
		 */
		public static function info(message:String):void 
		{
			log(message, LEVEL_INFO);
		}
		
		/**
		 * 
		 */
		public static function warning(message:String):void 
		{
			log(message, LEVEL_WARNING);
		}
		
		/**
		 * 
		 */
		public static function error(message:String):void 
		{
			log(message, LEVEL_ERROR);
		}
		
		/**
		 * 
		 */
		public static function fatal(message:String):void 
		{
			log(message, LEVEL_FATAL);
		}
		
		/**
		 * 
		 */
		private static function log(message:String, level:uint):void 
		{
			if(!_ready) {
				initializeError();
				return;
			}
			
			if (_level < level) { 
				return; 
			}
			
			var key:String = _keys[level];
			for each (var l:ILogger in _loggers) {
				l.output(message, key);
			}
		}

		private static function initializeError():void 
		{
		}

		public static function get level():uint {
			return _level;
		}
		
		static public function get ready():Boolean {
			return _ready;
		}
	}
}