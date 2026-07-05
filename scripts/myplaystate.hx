function onCreate() {
    trace("PlayState script yuklendi!");
    trace("Sarki: " + songName);
    trace("BPM: " + bpm);
    trace("Scroll Hizi: " + scrollSpeed);
}

function onBeatHit() {
    if (curBeat % 4 == 0) {
        FlxG.camera.zoom += 0.03;
    }
}

function onNoteHit(note) {
    FlxG.camera.shake(0.01, 0.1);
}

function onNoteMiss(note) {
    FlxG.camera.flash(FlxColor.RED, 0.3);
}

function onEndSong() {
    return 0;
}
