package;

import kha.Framebuffer;
import kha.input.Mouse;
import mozokengine.utils.NapeDebugDraw;
import nape.geom.Vec2;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import nape.space.Space;

class EscapeBot
{
	var space:Space = new Space(new Vec2(0,600));
	var objects:Array<NObject> = [];
	var debugDraw:NapeDebugDraw;

	public function new()
	{
		debugDraw = new NapeDebugDraw(space);
		var floorBody:Body = new Body(BodyType.STATIC);
		var floorBody2:Body = new Body(BodyType.STATIC);
		var floorBody3:Body = new Body(BodyType.STATIC);
		var floorShape:Polygon = new Polygon(Polygon.rect(10, 550, 800, 1));
		var floorShape2:Polygon = new Polygon(Polygon.rect(10, 0, 1, 600));
		var floorShape3:Polygon = new Polygon(Polygon.rect(800, 0, 1, 600));
		floorShape.body = floorBody;
		floorBody.shapes.add(floorShape);
		floorBody2.shapes.add(floorShape2);
		floorBody3.shapes.add(floorShape3);
		floorBody.space = space;
		floorBody2.space = space;
		floorBody3.space = space;

		Mouse.get().notify(handleMouseDown, null, null, null);
	}

	public function render(framebuffer:Framebuffer):Void
	{
		var g = framebuffer.g2;
		var pos:Vec2;
		g.begin();
		for (object in objects) {
			pos = object.body.position;

			g.pushRotation(object.body.rotation, pos.x, pos.y);
			g.drawImage(object.img, object.body.position.x, object.body.position.y);
			g.popTransformation();
		}
		debugDraw.draw(g);
		g.end();
	}

	public function update():Void
	{
		space.step(1/60);
	}

	public function destroy():Void
	{
	}

	function handleMouseDown(button:Int, x:Int, y:Int):Void
	{
		var no:NObject = new NObject(space);
		no.body.position = new Vec2(x, y);
		objects.push(no);
	}
}