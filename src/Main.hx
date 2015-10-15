
import luxe.Input;
import luxe.Sprite;
import luxe.Color;
import luxe.Vector;
import luxe.Text;


class Main extends luxe.Game {

    var block:Sprite;

    public static var ME:Main;

    public var numBunnies:Int;
    public var incBunnies:Int;
    public var smooth:Bool;
    public var gravity:Float;
    public var bunnies:Array <Bunny>;
    public var maxX:Int;
    public var minX:Int;
    public var maxY:Int;
    public var minY:Int;
    //private var bunnyAsset:BitmapData;
    private var drawList:Array<Float>;
    public var fps:FPS;
    public var counter:Text;

    override function config(config:luxe.AppConfig) {

        config.preload.textures.push({ id:'assets/wabbit_alpha.png' });
        
        return config;

    } //config

    override function ready() {
        ME = this;
        block = new Sprite({
            name: 'a sprite',
            pos: Luxe.screen.mid,
            color: new Color().rgb(0xf94b04),
            size: new Vector(128, 128)
        });

        fps = new FPS({
            pos: new Vector(10, 10)
        });

        counter = new Text({
            pos: new Vector(Luxe.screen.width - 200, 10)
        });
        runBunnies();
    } //ready

    override function onkeyup( e:KeyEvent ) {

        if(e.keycode == Key.escape) {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) {
        block.rotation_z += 40 * dt;
        counter.text = "Count: " + numBunnies;
    } //update

    override function onmousemove(event:MouseEvent) {
        block.pos = event.pos;
    }

    override function onmousedown( event:MouseEvent ) {
        if (numBunnies >= 1500) incBunnies = 250;
        var more = numBunnies + incBunnies;

        var bunny; 
        for (i in numBunnies...more)
        {
            bunny = new Bunny({
                pos: new Vector(0,0),
                texture : Luxe.resources.texture('assets/wabbit_alpha.png'),
            });
            bunny.speedX = Math.random() * 5;
            bunny.speedY = (Math.random() * 5) - 2.5;
            //bunny.scale = 0.3 + Math.random();
            //bunny.rotation = 15 - Math.random() * 30;
            bunnies.push(bunny);
        }
        numBunnies = more;
        trace (numBunnies);

    }

    private function runBunnies() {
        minX = 0;
        maxX = Std.int(Luxe.screen.width);
        minY = 0;
        maxY = Std.int(Luxe.screen.height);
        gravity = 0.5;
        incBunnies = 100;
        smooth = true;
        numBunnies = 500;

        //bunnyAsset = Assets.getBitmapData("assets/wabbit_alpha.png");
        //pirate = new Bitmap(Assets.getBitmapData("assets/pirate.png"), PixelSnapping.AUTO, true);
        //pirate.scaleX = pirate.scaleY = Env.height / 768;
        //addChild(pirate);
        
        bunnies = new Array<Bunny>();
        drawList = new Array<Float>();
        
        var bunny; 
        for (i in 0...numBunnies) 
        {
            bunny = new Bunny({
                pos: new Vector(0,0),
                texture : Luxe.resources.texture('assets/wabbit_alpha.png'),
            });
            bunny.speedX = Math.random() * 5;
            bunny.speedY = (Math.random() * 5) - 2.5;
            //bunny.scale = 0.3 + Math.random();
            //bunny.rotation = 15 - Math.random() * 30;
            bunnies.push(bunny);
        }

    }

} //Main
