package
{
	import jp.cellfusion.logger.Logger;

	import flash.display.Sprite;

	/**
	 * @author Mk-10:cellfusion (www.cellfusion.jp)
	 */
	public class Sample extends Sprite
	{
		public function Sample()
		{
			Logger.initialize(Logger.LEVEL_ALL, Logger.LOG_NONE);

			var hoge:String = "str";
			var fuga:Function = function():Number {
				return Math.random();
			};
			
			
			Logger.addLogFunction(trace);
			
			/*FDT_IGNORE*/
			CONFIG::Debug {
				Logger.trace("debug");
			}
			/*FDT_IGNORE*/
			
			Logger.trace("trace", 1, hoge);
			Logger.debug("debug", 1, hoge);
			Logger.info("info", 1, hoge);
			Logger.warning("warning", 1, hoge);
			Logger.error("error", 1, hoge);
			Logger.fatal("fatal", 1, hoge);
			
			trace("complete");
		}
	}
}
