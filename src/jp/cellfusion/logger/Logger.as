package jp.cellfusion.logger 
{

	/**
	 * @author cellfusion
	 * 
	 * Logger ライブラリ
	 * initialize 時に出力するレベルと出力先を設定します。
	 *
	 *
	 * レベル : デフォルトは全て出力。
	 * 
	 * レベルは下記のように必要な物だけ選択することも出来ます。
	 * Logger.initialize(Logger.LEVEL_TRACE | Logger.LEVEL_INFO | Logger.LEVEL_FATAL);
	 * 
	 * 下記のようにも設定できます。（Error 以外を出力）
	 * Logger.initialize(parseInt("101111", 2));
	 *  
	 * 出力先 : デフォルトでは trace と SOS Max へ出力します。
	 * 
	 * レベルと同じように必要な出力先だけに変更できます
	 * Logger.initialize(null, Logger.TRACE_LOG | Logger.SOSMAX_LOG);
	 * 
	 * 
	 * flex では trace が消せないので下記のように指定して出力しないように出来ます。
	 * Logger.initialize(null, Logger.NONE);
	 * 
	 * SOS Max
	 * http://www.sos.powerflasher.com/developer-tools/sosmax/home/
	 */
	public class Logger 
	{
		public static const LEVEL_TRACE:uint = 1;
		public static const LEVEL_DEBUG:uint = 2;
		public static const LEVEL_INFO:uint = 4;
		public static const LEVEL_WARNING:uint = 8;
		public static const LEVEL_ERROR:uint = 16;
		public static const LEVEL_FATAL:uint = 32;
		public static const NONE:uint = 0;
		public static const SOSMAX_LOG:uint = 1;
		public static const TRACE_LOG:uint = 2;
		private static var _level:uint;
		private static var _ready:Boolean = false;
		private static var _loggers:Array;

		/**
		 * @param level 出力レベル
		 * @param logger 出力先
		 * 
		 * 出力するレベルを選択
		 * 一度実行すると後からは変更できないのできないので、読み込み元では LEVEL_NONE を指定して常に出力が出ないようにすることも可能。
		 */
		public static function initialize(level:uint = 63, logger:uint = 3):void 
		{
			if (_ready) return;
			
			_level = level;
			
			_loggers = [];
			if ((logger & SOSMAX_LOG) == SOSMAX_LOG) _loggers.push(new SOSLogger());
			if ((logger & TRACE_LOG) == TRACE_LOG) _loggers.push(new TraceLogger());
			
			_ready = true;
		}

		/**
		 * trace レベルのログを出力
		 */
		public static function trace(message:String):void 
		{
			if ((_level & LEVEL_TRACE) == LEVEL_TRACE) log(message, "trace");
		}

		/**
		 * debug レベルのログを出力
		 */
		public static function debug(message:String):void 
		{
			if ((_level & LEVEL_DEBUG) == LEVEL_DEBUG) log(message, "debug");
		}

		/**
		 * info レベルのログを出力
		 */
		public static function info(message:String):void 
		{
			if ((_level & LEVEL_INFO) == LEVEL_INFO) log(message, "info");
		}

		/**
		 * 
		 */
		public static function warning(message:String):void 
		{
			if ((_level & LEVEL_WARNING) == LEVEL_WARNING) log(message, "warning");
		}

		/**
		 * 
		 */
		public static function error(message:String):void 
		{
			if ((_level & LEVEL_ERROR) == LEVEL_ERROR) log(message, "error");
		}

		/**
		 * 
		 */
		public static function fatal(message:String):void 
		{
			if ((_level & LEVEL_FATAL) == LEVEL_FATAL) log(message, "fatal");
		}

		/**
		 * 
		 */
		private static function log(message:String, key:String):void 
		{
			if(!_ready) {
				initializeError();
				return;
			}
			
			for each (var l:ILogger in _loggers) {
				l.output(message, key);
			}
		}

		private static function initializeError():void 
		{
			throw new Error("Logger initialize error.");
		}

		public static function get level():uint 
		{
			return _level;
		}

		static public function get ready():Boolean 
		{
			return _ready;
		}
	}
}