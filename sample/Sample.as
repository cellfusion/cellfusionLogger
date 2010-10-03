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
			Logger.initialize();

			var hoge:String = "str";
			var fuga:Function = function():Number {
				return Math.random();
			};
			
			Logger.trace("trace", 1, hoge, fuga);
			Logger.debug("debug", 1, hoge, fuga);
			Logger.info("info", 1, hoge, fuga);
			Logger.warning("warning", 1, hoge, fuga);
			Logger.error("error", 1, hoge, fuga);
			Logger.fatal("fatal", 1, hoge, fuga);
		}
	}
}
