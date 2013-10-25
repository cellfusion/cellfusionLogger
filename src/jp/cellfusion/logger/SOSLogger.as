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

			_ready = true;
		}

		public function output(key:uint, message:String):void
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

			switch (key) {
				case Logger.LEVEL_DEBUG:
					_socket.send("!SOS<showMessage key='debug'>" + m + "</showMessage>\n");
					break;
				case Logger.LEVEL_INFO:
					_socket.send("!SOS<showMessage key='info'>" + m + "</showMessage>\n");
					break;
				case Logger.LEVEL_WARNING:
					_socket.send("!SOS<showMessage key='warning'>" + m + "</showMessage>\n");
					break;
				case Logger.LEVEL_ERROR:
					_socket.send("!SOS<showMessage key='error'>" + m + "</showMessage>\n");
					break;
				case Logger.LEVEL_FATAL:
					_socket.send("!SOS<showMessage key='fatal'>" + m + "</showMessage>\n");
					break;
				default:
					_socket.send(m);
			}


		}
	}
}