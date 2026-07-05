// Ornek modifier
// Bu dosyayi scripts/modifiers/ klasorune koyun

function getName() {
    return "exampleMod";
}

function getModType() {
    return "NOTE_MOD";
}

function getOrder() {
    return 0;
}

function doesUpdate() {
    return true;
}

function getSubmods() {
    return {
        "exampleSpeed": 1.0,
        "exampleOffset": 0.0
    };
}

function getPos(time, diff, tDiff, beat, pos, data, player, obj) {
    var speed = getSubmodValue("exampleSpeed", 1.0);
    var offset = getSubmodValue("exampleOffset", 0.0);
    pos.x += offset;
    pos.y += Math.sin(beat * speed) * 50;
    return pos;
}

function updateNote(beat, note, pos, player) {
    // Nota guncelleme
}

function updateReceptor(beat, receptor, pos, player) {
    // Receptor guncelleme
}
