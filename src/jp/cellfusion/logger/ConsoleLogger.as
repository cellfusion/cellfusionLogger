/**
 * Author: Mk-10:cellfusion
 */
package jp.cellfusion.logger
{
	import flash.external.ExternalInterface;

	public class ConsoleLogger implements ILogger
	{
		public function output(key:uint, message:String):void
		{
			var keyStr:String;
			switch (key) {
				case Logger.LEVEL_DEBUG:
					ExternalInterface.call("console.debug", message);
					break;
				case Logger.LEVEL_INFO:
					ExternalInterface.call("console.log", message);
					break;
				case Logger.LEVEL_WARNING: keyStr = "";
					ExternalInterface.call("console.warn", message);
					break;
				case Logger.LEVEL_ERROR:
					ExternalInterface.call("console.error", message);
					break;
				case Logger.LEVEL_FATAL:
					ExternalInterface.call("console.error", "[FATAL] "+message);
					break;
				default:
					ExternalInterface.call("console.log", message);
			}


		}
	}
}
