/**
 * Author: Mk-10:cellfusion
 */
package jp.cellfusion.logger
{
	public class FunctionLogger implements ILogger
	{
		private var _logFunction:Function;
		public function FunctionLogger(logFunction:Function)
		{
			_logFunction = logFunction;
		}

		public function output(key:uint, message:String):void
		{
			_logFunction.call(null, "[" + key + "] " + message);
		}
	}
}
