package jp.cellfusion.logger
{
	/**
	 * @author cellfusion
	 */
	public class TraceLogger implements ILogger
	{
		public function output(key:String, message:String):void
		{
			trace("[" + key + "] " + message);
		}
	}
}