package jp.cellfusion.logger
{
	/**
	 * @author cellfusion
	 */
	public class TraceLogger implements ILogger
	{
		public function output(key:String, message:Array):void
		{
			var m:String = "";
			for (var i:uint = 0; i < message.length; i++) {
				if (i > 0) m += ", ";
				m += message[i];
			}
			trace("[" + key + "] " + m);
		}
	}
}