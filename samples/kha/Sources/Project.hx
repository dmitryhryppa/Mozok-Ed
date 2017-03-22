package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.input.Mouse;
import sceneedhx.EdHx;

class Project 
{
    private var sc:EdHx;
    
    private var gameObjects:Array<GameObject>;
	public function new() 
    {
        sc = new EdHx();
        
        gameObjects = new Array<GameObject>();
        var index:Int = 0;
        Mouse.get().notify(function(btn:Int, x:Int, y:Int):Void
        {
            var go:GameObject = new GameObject();
            gameObjects.push(go);
            sc.addObject(go, "GameObject_" + index);
            index++;
        }, null, null, null);
        
		System.notifyOnRender(render);
		Scheduler.addTimeTask(update, 0, 1 / 60);
	}

	private function update(): Void 
    {
		
	}

	private function render(framebuffer: Framebuffer): Void 
    {
		framebuffer.g2.begin();
        for (gameObject in gameObjects){
            framebuffer.g2.color = gameObject.color;
            framebuffer.g2.fillRect(gameObject.x, gameObject.y, gameObject.w, gameObject.h);
        }
        framebuffer.g2.end();
	}
}
