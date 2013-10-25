package jp.cellfusion.logger.sample
{
	import jp.cellfusion.logger.ConsoleLogger;
	import jp.cellfusion.logger.ILogger;
	import jp.cellfusion.logger.Logger;

	import flash.display.Sprite;

	import jp.cellfusion.logger.TraceLogger;

	/**
	 * @author Mk-10:cellfusion (www.cellfusion.jp)
	 */
	public class Sample extends Sprite
	{
		public function Sample()
		{
			var hoge:String = "str";

			CONFIG::debug {
				Logger.initialize(Logger.LEVEL_ALL, new <ILogger>[new TraceLogger(), new ConsoleLogger()]);
				trace("debug mode");
			}

			Logger.debug("debug", 1, hoge);
			Logger.info("info", 1, hoge);
			Logger.warning("warning", 1, hoge);
			Logger.error("error", 1, hoge);
			Logger.fatal("fatal", 1, hoge);

			//Logger.stackTrace();
			
			trace("complete");
		}
	}
}
