package;

import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.input.Mouse;

class Project 
{
    private var sc:Sceneed;
    private var gameObj:GameObject;
    
	public function new() 
    {
        gameObj = new GameObject();
        
        sc = new Sceneed();
        
        Mouse.get().notify(function(btn:Int, x:Int, y:Int):Void
        {
            sc.addObject(gameObj, "Some Object");
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
        framebuffer.g2.color = gameObj.color;
        framebuffer.g2.fillRect(gameObj.x, gameObj.y, gameObj.w, gameObj.h);
        framebuffer.g2.end();
	}
}
