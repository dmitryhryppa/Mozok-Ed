package;
import kha.Color;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
class GameObject 
{
    public var color:Color;
    public var x:Int;
    public var y:Int;
    public var w:Int;
    public var h:Int;
    
    public function new() 
    {
        x = Std.random(100);
        y = Std.random(100);
        w = 100;
        h = 100;
        color = Color.White;
    }
}