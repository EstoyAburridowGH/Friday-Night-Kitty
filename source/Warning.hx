package;

import flixel.FlxSprite;
import flixel.FlxG;

class Warning extends MusicBeatState {
    public static var canAppear:Bool = true;

    override public function create() {
        super.create();

        FlxG.mouse.visible = false;
    
        var warningSpr:FlxSprite = new FlxSprite();
        warningSpr.loadGraphic(Paths.image("unknown"));
        warningSpr.setGraphicSize(FlxG.width, FlxG.height);
        warningSpr.updateHitbox();
        warningSpr.scrollFactor.set();
        add(warningSpr);
    }

    var alreadyPressedO:Bool = false;
    var alreadyPressedEnter:Bool = false;
    override public function update(elapsed:Float) {
        super.update(elapsed);

        if (FlxG.keys.justPressed.O && !alreadyPressedO) {
            alreadyPressedO = true;
            
            canAppear = false;
        }

        if (FlxG.keys.justPressed.ENTER && !alreadyPressedEnter) {
            alreadyPressedEnter = true;
            
            MusicBeatState.switchState(new TitleState());
        }
    }
}