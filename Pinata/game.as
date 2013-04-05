package
{
import flash.display.Sprite;
import energyBar;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.events.TimerEvent;
import flash.utils.Timer;

public class game extends Sprite
{
private var b:energyBar;
private var val:uint = 0;
private var myTimer:Timer = new Timer(50);
private var a:Candy = new Candy();
//Decides whether the power bar is traveling in the right direction. 
//Moving left to right is True, and right to left is False.
private var directionControl:Boolean;
    

public function game()
{
 init();
}

private function init():void
{
 
 a.x = 50;
 a.y = 50;
 addChild(a);

 b = new energyBar(a, val);
 addChild(b);

 a.addEventListener(MouseEvent.CLICK, onClick);
}

private function onClick(e:Event):void
{
 if(val >= 0 && val != 100) 
 {
  myTimer.start();
  myTimer.addEventListener(TimerEvent.TIMER, blah);
 }
 else
 {
  myTimer.stop();
 }
 a.removeEventListener(MouseEvent.CLICK, onClick);
 a.addEventListener(MouseEvent.CLICK, onSecondClick);
 
}

private function blah(e:TimerEvent):void
{
	if(val == 0 ) 
	{
		val+=5;
  		b.updateBar(val);
		directionControl = true; 
	}
	else if (val == 100 )
	{
		val -= 5;
		b.updateBar(val);
		directionControl = false; 
		
	}
	else if (val > 0 && val != 100 && directionControl == false)
	{
		val-=5;
  		b.updateBar(val);
	}
	else if (val > 0 && val != 100 && directionControl == true)
	{
		val+=5;
  		b.updateBar(val);
	}
	
}	
	private function onSecondClick(e:Event):void
	{
		myTimer.stop();
		a.removeEventListener(MouseEvent.CLICK, onSecondClick);
 		a.addEventListener(MouseEvent.CLICK, onClick);
	}
	
	

}
}