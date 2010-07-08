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
			
			Logger.trace("trace");
			Logger.debug("debug");
			Logger.info("info");
			Logger.warning("warning");
			Logger.error("error");
			Logger.fatal("fatal");
		}
	}
}
