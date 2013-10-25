package jp.cellfusion.logger
{
	/**
	 * @author cellfusion
	 */
	public class TraceLogger implements ILogger
	{
		public function output(key:uint, message:String):void
		{
			switch (key) {
				case Logger.LEVEL_DEBUG:
					trace("[DEBUG] " + message);
					break;
				case Logger.LEVEL_INFO:
					trace("[INFO] " + message);
					break;
				case Logger.LEVEL_WARNING:
					trace("[WARNING] " + message);
					break;
				case Logger.LEVEL_ERROR:
					trace("[ERROR] " + message);
					break;
				case Logger.LEVEL_FATAL:
					trace("[FATAL] " + message);
					break;
				default:
					trace(message);
			}

		}
	}
}