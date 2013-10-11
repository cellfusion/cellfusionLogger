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

		public function output(key:String, message:Array):void
		{
			_logFunction.apply(null, [message, key]);
		}
	}
}
