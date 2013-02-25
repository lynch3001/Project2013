package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import net.hires.debug.Stats;
	import flash.events.TouchEvent;
	//Multitouch.inputMode = MultitouchInputMode.NONE;
	
	/**
	 * ...
	 * @author Thomas Vian
	 */
	public class PageCurl extends Sprite 
	{
		[Embed(source = '/rexam-1.jpg')]
		protected var Page1:Class;
		
		protected var _image1:Bitmap;
		
		protected var _filter:PageCurlFilter;
		
		public function PageCurl():void 
		{
			_filter = new PageCurlFilter();
			
			_image1 = new Page1();
			_image1.x = stage.stageWidth * 0.5 - _image1.width * 0.5;
			_image1.y = stage.stageHeight * 0.5 - _image1.height * 0.5;
			_image1.filters = [_filter]
			
			addEventListener(Event.ENTER_FRAME, onFrame);
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouch);
			
			
			addChild(_image1);
			addChild(new Stats);
		}
		
		public function onFrame(e:Event):void
		{
			var dx:Number = 1 - mouseX / stage.stageWidth;
			var dy:Number = 1 - mouseY / stage.stageHeight;
			
			var dist:Number = Math.sqrt(dx * dx + dy * dy);
			var ang:Number = Math.atan2(dy, dx);
			
			_filter.setPageCurl(10 - dist*5, ang);
			_image1.filters = [_filter];
			
		}
		
		public function onTouch(e:TouchEvent):void
		{
			
		}
		
	}
	
}