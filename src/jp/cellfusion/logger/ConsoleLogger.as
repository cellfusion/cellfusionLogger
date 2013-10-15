/**
 * Author: Mk-10:cellfusion
 */
package jp.cellfusion.logger
{
	import flash.external.ExternalInterface;

	public class ConsoleLogger implements ILogger
	{
		public function output(key:String, message:String):void
		{
			ExternalInterface.call("console.log", "[" + key + "] " + message);
		}
	}
}
