package
{
import flash.display.MovieClip;
import flash.events.Event;

public class hero extends MovieClip
{

public function hero()
{
 addEventListener(Event.ENTER_FRAME, onFrame);
}
private function onFrame(evt:Event):void
{
 x++;
 y++;
}
}
}