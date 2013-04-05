package
{
import flash.display.Sprite;
import flash.geom.Rectangle;
import flash.events.Event;

public class energyBar extends Sprite
{
private var _do:Sprite;
private var _ev:uint;

public function energyBar(displayObj, energyValue)
{
 _do = displayObj;
 _ev = energyValue;
 init();
 addEventListener(Event.ENTER_FRAME, onFrame);
}

private function onFrame(evt:Event):void
{
 x = _do.x;
 y = _do.y - 20; 
}

private function init():void
{
 x = _do.x;
 y = _do.y - 20;

 this.graphics.lineStyle(1);
 this.graphics.beginFill(0x000000);
 this.graphics.drawRect(0,0,102,15);
 this.graphics.endFill();
 this.graphics.beginFill(0x00ff00);
 this.graphics.drawRect(1,1,_ev,13);
 this.graphics.endFill();
}

public function updateBar(newval):void
{
 _ev = newval;
 this.graphics.clear();
 this.graphics.lineStyle(1);
 this.graphics.beginFill(0x000000);
 this.graphics.drawRect(0,0,102,15);
 this.graphics.endFill();
 this.graphics.beginFill(0x00ff00);
 this.graphics.drawRect(1,1,newval,13);
 this.graphics.endFill();
}
}
}