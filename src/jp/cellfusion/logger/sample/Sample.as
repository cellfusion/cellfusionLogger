package jp.cellfusion.logger.sample
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
			var hoge:String = "str";

			CONFIG::debug {
				Logger.initialize(Logger.LEVEL_ALL);
				Logger.trace("debug");
			}

			Logger.trace("trace", 1, hoge);
			Logger.debug("debug", 1, hoge);
			Logger.info("info", 1, hoge);
			Logger.warning("warning", 1, hoge);
			Logger.error("error", 1, hoge);
			Logger.fatal("fatal", 1, hoge);

			Logger.stackTrace();
			
			trace("complete");
		}
	}
}
