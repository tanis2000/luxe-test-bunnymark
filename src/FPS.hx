import haxe.Timer;
import luxe.Text;


class FPS extends Text {
	
	
	public var currentFPS (default, null):Int;
	
	private var cacheCount:Int;
	private var times:Array <Float>;
	
	
	override public function new (_options:luxe.options.TextOptions) {
		
		super(_options);
		
		currentFPS = 0;
		text = "FPS: ";
		
		cacheCount = 0;
		times = [];
		
	}
	
	
	
	
	// Event Handlers
	
	
	
	
	override function update (dt:Float) {
		
		var currentTime = Timer.stamp ();
		times.push (currentTime);
		
		while (times[0] < currentTime - 1) {
			
			times.shift ();
			
		}
		
		var currentCount = times.length;
		currentFPS = Math.round ((currentCount + cacheCount) / 2);
		
		if (currentCount != cacheCount /*&& visible*/) {
			
			text = "FPS: " + currentFPS;
			
		}
		
		cacheCount = currentCount;
		
	}
	
	
}
