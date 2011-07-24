package jp.cellfusion.logger
{
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.SecurityErrorEvent;
	import flash.net.XMLSocket;

	/**
	 * @author Mk-10:cellfusion
	 * SOSMax 用のロガークラス
	 * 
	 * SOSMax
	 * http://www.sos.powerflasher.com/
	 */
	public class SOSLogger implements ILogger
	{
		private var _socket:XMLSocket;
		private var _ready:Boolean = false;

		/**
		 * 初期化
		 * @param level 出力するレベルの設定(default INFO)
		 */
		public function SOSLogger()
		{
			_socket = new XMLSocket();
			_socket.addEventListener(Event.CONNECT, connectHandler);
			_socket.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			_socket.addEventListener(SecurityErrorEvent.SECURITY_ERROR, securityErrorHandler);

			try {
				_socket.connect('localhost', 4444);
			} catch (e:SecurityError) {
				//trace('SecurityError in SOSAppender:' + e);
				return;
			}

			_ready = true;
		}

		private function securityErrorHandler(event:SecurityErrorEvent):void
		{
			// trace('Error in SOSAppender:' + event);
		}

		private function ioErrorHandler(event:IOErrorEvent):void
		{
			// trace('Error in SOSAppender:' + event);
		}

		private function connectHandler(event:Event):void
		{
			// trace('!Connected is SOS!');
		}

		public function output(key:String, message:Array):void
		{
			if (!_ready) {
				return;
			}

			var m:String = "";
			for (var i:uint = 0; i < message.length; i++) {
				if (i > 0) m += ", ";
				m += message[i];
			}

			// タグなどを変換
			m = m.replace(/\</g, "&lt;");
			m = m.replace(/\>/g, "&gt;");
			m = m.replace(/\&/g, "&amp;");

			try {
				_socket.send("!SOS<showMessage key='" + key + "'>" + m + "</showMessage>\n");
			} catch (e:Error) {
				// trace('SOSLogger send Error.');
			}
		}
	}
}