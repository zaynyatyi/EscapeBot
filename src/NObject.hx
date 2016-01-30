package;
import kha.Assets;
import kha.Image;
import nape.phys.Body;
import nape.phys.BodyType;
import nape.shape.Polygon;
import nape.space.Space;

/**
 * ...
 * @author zaynyatyi
 */
class NObject
{
	public var body:Body = new Body(BodyType.DYNAMIC);
	public var img:Image = Assets.images.crate;

	public function new (space:Space)
	{
		body.space = space;
		body.shapes.add(new Polygon(Polygon.box(100, 100)));
		body.mass = 100;
	}
}