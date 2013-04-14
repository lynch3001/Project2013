package 
{
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.Event;
	import net.hires.debug.Stats;
	import flash.events.TouchEvent;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	//Multitouch.inputMode = MultitouchInputMode.NONE;
	
	/**
	 * ...
	 * @author Thomas Vian
	 */
	public class PageCurl extends Sprite 
	{
		protected var dist:Number;
		protected var ang:Number; 
		protected var dy:Number;
		protected var dx:Number;
		protected var t:Timer;
		
		
		[Embed(source = '/rexam-1.jpg')]
		protected var Page1:Class;
		
		protected var _image1:Bitmap;
		
		
		[Embed(source = '/Firefox.jpg')]
		protected var Page2:Class;
		
		protected var _image2:Bitmap;
		
		protected var _filter:PageCurlFilter;
		
		public function PageCurl():void 
		{
			_filter = new PageCurlFilter();
			
			_image1 = new Page1();
			_image1.x = stage.stageWidth * 0.5 - _image1.width * 0.5;
			_image1.y = stage.stageHeight * 0.5 - _image1.height * 0.5;
			_image1.filters = [_filter]
			
			_image2 = new Page2();
			_image2.x = stage.stageWidth * 0.5 - _image2.width * 0.5;
			_image2.y = stage.stageHeight * 0.5 - _image2.height * 0.5;
			_image2.filters = [_filter]
			
			addEventListener(Event.ENTER_FRAME, onFrame);
			addEventListener(TouchEvent.TOUCH_BEGIN, onTouch);
			
			
			addChild(_image1);
			addChild(new Stats);
		}
		
		public function onFrame(e:Event):void
		{
			var t:Timer = new Timer(1000, 1);
			
			dx = 1 - mouseX / stage.stageWidth;
			dy = 1 - mouseY / stage.stageHeight;
			
			dist = Math.sqrt(dx * dx + dy * dy);
			ang = Math.atan2(dy, dx);
			
			_filter.setPageCurl(10 - dist*5, ang);
			_image1.filters = [_filter];
			_image2.filters = [_filter];
			
			t.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			
			t.start();
		}
		

		public function onTouch(e:TouchEvent):void
		{
			//code goes here for touch screen devices
			
		}
		
		public function OMGTimer() {
			t = new Timer(10000, 1);
			t.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
			trace("Timer running");
			t.start();
		}

		private function onTimerComplete(event : TimerEvent) : void 
		{
			if (dist <= 1.4 && ang <= 1.4 && stage.contains(_image1))
			{
				trace("its time");
				removeChild(_image1);
				addChild(_image2 );
				addChild(new Stats);
				
				
			}
			
		}

		
	}
	
}