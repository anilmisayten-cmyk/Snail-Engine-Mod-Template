# Snail Engine Mod Template

Snail Engine icin hazir mod sablonu. Bu template'i kullanarak hizlica mod olusturabilirsiniz.

## Kurulum

1. Bu template'i indirin
2. `meta.json` dosyasini acin ve mod adini degistirin
3. Klasorleri kendi modunuza gore doldurun
4. Modu `content/` klasorune koyun

## Klasor Yapisi (Gercek base-game-main Yapisi)

```
my-mod/
├── meta.json                    ← Mod meta verileri
├── README.md                    ← Bu dosya
│
├── data/                        ← Oyun verileri
│   ├── characters/              ← Character JSON'lari (.json) + script'leri (.hx)
│   ├── stages/                  ← Stage klasorleri (data.json + script.hx)
│   ├── weeks/                   ← Week JSON'lari
│   ├── songs/                   ← BOZUK: Sarkilari burada arama!
│   ├── noteskins/               ← Nota skin JSON'lari
│   ├── notetypes/               ← Ozel nota tipleri (.hx)
│   ├── events/                  ← Event tanimlari (.txt)
│   ├── dialogue/                ← Dialog dosyalari
│   ├── scripts/                 ← Global script'ler (pixelUI.hx vb.)
│   └── freeplay.json            ← Freeplay menu ayarlari
│
├── songs/                       ← SARKILAR BURADA!
│   └── my-song/
│       ├── audio/               ← Ses dosyalari
│       │   ├── Inst.ogg         ← Ana sarki (zorunlu)
│       │   ├── Voices.ogg       ← Vokaller
│       │   ├── Voices-opp.ogg   ← Opponent vokal (opsiyonel)
│       │   └── Voices-player.ogg← Player vokal (opsiyonel)
│       ├── charts/              ← Chart dosyalari
│       │   ├── easy.json
│       │   ├── normal.json
│       │   ├── hard.json
│       │   └── events.json
│       ├── meta.json            ← Sarki bilgileri
│       └── info.txt             ← Eski format bilgi
│
├── images/                      ← Gorseller
│   ├── backgrounds/             ← Arka plan gorselleri
│   ├── characters/              ← Character spritesheet'leri (.png + .xml)
│   ├── cutscenes/               ← Cutscene animasyonlari
│   ├── menus/                   ← Menu gorselleri
│   ├── pixelUI/                 ← Pixel art UI
│   └── UI/                      ← UI gorselleri (icon64, icons, notes)
│
├── sounds/                      ← Ses efektleri
├── music/                       ← Arka plan muzikleri
├── shaders/                     ← GLSL shader dosyalari (.frag)
└── scripts/                     ← Script'ler (global, modifier, state)
```

## Hizli Baslangic

### 1. Character Olusturma

1. `data/characters/` klasorune gidin
2. `dad.json` dosyasini ornek alin
3. Yeni character JSON'i olusturun
4. Spritesheet'i `images/characters/` klasorune koyun

### 2. Sarki Olusturma

1. `songs/` klasorune gidin
2. `my-song/` klasorunu olusturun
3. `audio/` icine Inst.ogg ve Voices.ogg koyun
4. `charts/` icine easy.json, normal.json, hard.json olusturun
5. `meta.json` ve `info.txt` dosyalarini olusturun

### 3. Stage Olusturma

1. `data/stages/` klasorune gidin
2. `mystage/` klasorunu olusturun
3. `data.json` ve `script.hx` dosyalarini olusturun
4. Arka plan gorsellerini `images/backgrounds/mystage/` klasorune koyun

### 4. Week Olusturma

1. `data/weeks/` klasorune gidin
2. `my-week.json` dosyasini olusturun
3. Sarki ve character'larin dogru oldugundan emin olun

## Dosya Formatlari

### Character JSON

```json
{
    "animations": [
        {"anim": "idle", "name": "BF idle dance", "fps": 24, "loop": false, "offsets": [-2, -2], "indices": []},
        {"anim": "singLEFT", "name": "BF NOTE LEFT0", "fps": 24, "loop": false, "offsets": [3, 61], "indices": []},
        {"anim": "singDOWN", "name": "BF NOTE DOWN0", "fps": 24, "loop": false, "offsets": [0, -19], "indices": []},
        {"anim": "singUP", "name": "BF NOTE UP0", "fps": 24, "loop": false, "offsets": [-6, 27], "indices": []},
        {"anim": "singRIGHT", "name": "BF NOTE RIGHT0", "fps": 24, "loop": false, "offsets": [-34, -7], "indices": []}
    ],
    "image": "characters/bf",
    "scale": 1,
    "sing_duration": 4,
    "healthicon": "bf",
    "position": [-10, 340],
    "camera_position": [30, -34],
    "flip_x": true,
    "no_antialiasing": false,
    "healthbar_colour": -13520687
}
```

### Song Chart JSON

```json
{
    "song": "my-song",
    "notes": [],
    "events": [],
    "bpm": 120,
    "needsVoices": true,
    "speed": 1.8,
    "keys": 4,
    "lanes": 2,
    "player1": "bf",
    "player2": "dad",
    "gfVersion": "gf",
    "stage": "stage",
    "format": "nmv2"
}
```

### Stage JSON

```json
{
    "defaultZoom": 0.9,
    "isPixelStage": false,
    "boyfriend": [770, 100],
    "girlfriend": [400, 130],
    "opponent": [100, 100],
    "hide_girlfriend": false,
    "camera_boyfriend": [0, 0],
    "camera_opponent": [0, 0],
    "camera_girlfriend": [0, 0],
    "camera_speed": 1,
    "dadZIndex": 3,
    "bfZIndex": 3,
    "gfZIndex": 3,
    "stageObjects": [
        {
            "id": "bg",
            "asset": "stageback",
            "position": [-600, -200],
            "zIndex": 1
        }
    ]
}
```

### Week JSON

```json
{
    "songs": [
        ["my-song", "dad", [146, 113, 253]]
    ],
    "weekCharacters": ["dad", "bf", "gf"],
    "weekBackground": "stage",
    "weekBefore": "",
    "storyName": "My Week",
    "weekName": "Week 1",
    "freeplayColor": [146, 113, 253],
    "startUnlocked": true,
    "hiddenUntilUnlocked": false,
    "hideStoryMode": false,
    "hideFreeplay": false
}
```

### Meta JSON

```json
{
    "name": "My Mod",
    "description": "My awesome mod",
    "global": false,
    "windowTitle": "Friday Night Funkin' - My Mod",
    "iconFile": "UI/icon64",
    "defaultTransition": "swipe"
}
```

### Noteskin JSON

```json
{
    "noteTexture": "UI/notes/NOTE_assets",
    "splashTexture": "UI/notes/noteSplashes-vanilla",
    "sustainSplashTexture": "UI/notes/holdCover",
    "antialiasing": true,
    "singAnimations": ["singLEFT", "singDOWN", "singUP", "singRIGHT"],
    "noteScale": 0.7,
    "splashScale": 1,
    "inGameColoring": true,
    "splashesEnabled": true,
    "susSplashesEnabled": true
}
```

## Script Ornekleri

### Global Script (scripts/global.hx)

```haxe
function onCreate() {
    trace("Mod yuklendi!");
}

function onBeatHit() {
    // Her beat'te calisir
}
```

### PlayState Script (scripts/myplaystate.hx)

```haxe
function onCreate() {
    trace("Sarki: " + songName);
    trace("BPM: " + bpm);
}

function onBeatHit() {
    if (curBeat % 4 == 0) {
        FlxG.camera.zoom += 0.03;
    }
}

function onNoteHit(note) {
    FlxG.camera.shake(0.01, 0.1);
}
```

### Stage Script (data/stages/mystage/script.hx)

```haxe
function onCreate() {
    trace("Stage yuklendi!");
}

function onBeatHit() {
    if (curBeat % 4 == 0) {
        bg.animation.play("lightning");
    }
}
```

### Modifier Script (scripts/modifiers/my-modifier.hx)

```haxe
function getName() {
    return "myModifier";
}

function getModType() {
    return "NOTE_MOD";
}

function getPos(time, diff, tDiff, beat, pos, data, player, obj) {
    pos.y += Math.sin(beat * 2) * 50;
    return pos;
}
```

## Sprite Formatlari

### PNG + XML (Sparrow Atlas)
- `characters/bf.png` + `characters/bf.xml`
- En eski ve en yaygin format
- `Paths.getSparrowAtlas()` ile yuklenir

### Animate Atlas
- `characters/darnellBlazin/Animation.json`
- `characters/darnellBlazin/spritemap1.json`
- `characters/darnellBlazin/spritemap1.png`
- Daha yeni format, buyuk animasyonlar icin

### Packer Atlas
- `characters/spirit.txt` + `characters/spirit.png`
- En basit format

## Mod Yuku

1. Mod klasorunu `content/` altina koyun
2. Oyuna girin
3. TAB tusuna basin (Mods menusu)
4. Modu aktif edin

## Sik Sorulan Sorular

### Sarki nerede?
`songs/` klasorunde! `data/songs/` DEGIL!

### Character nerede?
`data/characters/` klasorunde `.json` dosyalari olarak.

### Stage nerede?
`data/stages/` klasorunde her biri icin ayri klasor olarak.

### Script nerede?
- Global: `scripts/` klasorunde
- Stage: `data/stages/mystage/script.hx`
- Modifier: `scripts/modifiers/` klasorunde
- PlayState: `scripts/` klasorunde

### Shader nerede?
`shaders/` klasorunde `.frag` dosyalari olarak.

### Ses dosyalari nerede?
- Sarki sesleri: `songs/my-song/audio/`
- Ses efektleri: `sounds/`
- Muzikler: `music/`

### Gorseller nerede?
- Character: `images/characters/`
- Stage: `images/backgrounds/`
- UI: `images/UI/`

## Lisans

Apache 2.0
