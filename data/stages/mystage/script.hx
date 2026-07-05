function onCreate() {
    trace("Stage script yuklendi!");
}

function onBeatHit() {
    if (curBeat % 4 == 0) {
        trace("Beat: " + curBeat);
    }
}

function onUpdate(elapsed) {
    // Frame guncelleme
}
