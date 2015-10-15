import luxe.Sprite;
import luxe.Vector;
import luxe.Color;


class Bunny extends luxe.Sprite {

	var sprite:Sprite;
	public var speedX:Float;
	public var speedY:Float;

	override public function new(_options:luxe.options.SpriteOptions) {
		super(_options);
	}

    override function update(dt:Float) {
		pos.x += speedX;
		pos.y += speedY;
		speedY += Main.ME.gravity;
		//bunny.alpha = 0.3 + 0.7 * bunny.position.y / maxY;
		
		if (pos.x > Main.ME.maxX)
		{
			speedX *= -1;
			pos.x = Main.ME.maxX;
		}
		else if (pos.x < Main.ME.minX)
		{
			speedX *= -1;
			pos.x = Main.ME.minX;
		}
		if (pos.y > Main.ME.maxY)
		{
			speedY *= -0.8;
			pos.y = Main.ME.maxY;
			if (Math.random() > 0.5) speedY -= 3 + Math.random() * 4;
		} 
		else if (pos.y < Main.ME.minY)
		{
			speedY = 0;
			pos.y = Main.ME.minY;
		}
		
	}

}