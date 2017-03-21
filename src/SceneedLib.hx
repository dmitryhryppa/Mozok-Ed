package;
import sys.net.Host;
import sys.net.Socket;
import cs.system.threading.Thread;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
class SceneedLib 
{
    private static var socket:Socket;
    private static var host:Host;
    private static inline var port:Int = 3498;
    public static function run():Void 
    {
        host = new Host("127.0.0.1");
        
        socket = new Socket();
        socket.bind(host, port);
        socket.listen(1);

        var loopThread:Thread = new Thread(loop);
        loopThread.Start();
    }
    
    private static function loop():Void
    {
        var s:Socket = null;
        while (true){
            try {
                if (s == null){
                    s = socket.accept();
                } else {
                    var type:Int = s.input.readByte();
                    var length:Int = s.input.readInt16();
                    var str:String = s.input.readString(length);

                    trace(str);
                }
            } catch (e:Dynamic){
                s = null;
                trace(e);
            }
        }
    }
}
