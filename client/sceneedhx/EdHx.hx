package sceneedhx;

import cpp.vm.Thread;
import haxe.Json;
import haxe.io.Bytes;
import sys.net.Host;
import sys.net.Socket;

/**
 * ...
 * @author Dmitry Hryppa	http://themozokteam.com/
 */
class EdHx 
{
    private var socket:Socket;
    
    private var allObjects:Map<String, Dynamic>;
    private var edObjects:Array<EdObject>;
    
    public function new()
    {
        allObjects = new Map<String, Dynamic>();
        edObjects = new Array<EdObject>();
        
        socket = new Socket();
        try {
            socket.connect(new Host("127.0.0.1"), 3498);
            
            //Thread.create(catchMessage);
        } catch (e:Dynamic){
            trace(e);
        }
    }
    
    public function addObject(object:Dynamic, name:String):Void
    {
        if (Reflect.isObject(object)){
            var fileds:Array<String> = Reflect.fields(object);
            var properties:Array<Dynamic> = [];
            for (i in 0...fileds.length){
                var fieldName:String = fileds[i];
                var result:String = '{"' + fieldName + '":"' + Reflect.getProperty(object, fieldName) + '"}';
                properties.push(Json.parse(result));
            }
            allObjects.set(name, object);
            edObjects.push({name:name, properties:properties});
            
            var data:String = Json.stringify({scene:edObjects});
            socket.output.writeByte(EdPackageType.SCENE);
            socket.output.writeInt16(data.length);
            socket.output.writeString(data);
        }
    }
    
    private function catchMessage():Void
    {
        while (true) {
            var length:Int = socket.input.readInt16();
            if (length > 0){
                var response:String = socket.input.readString(length);
                parse(response);
            }
        }
    }
    
    private inline function parse(response:String):Void
    {
        trace(response);
    }
}