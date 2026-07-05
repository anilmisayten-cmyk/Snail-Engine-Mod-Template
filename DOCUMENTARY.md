# Snail Engine Modding Documentary

## Tam Kapsamli Mod Yapima Rehberi

---

## Bolum 1: Giris

### 1.1 Snail Engine Nedir?

Snail Engine, Friday Night Funkin' (FNF) oyunu icin gelistirilmis bir mod motorudur. Psych Engine 0.5.2h uzerine insa edilmis olup, ozellestirilmis CFFI primitives, gelismis modchart sistemi, ve genis shader yelpazesi ile FNF modding dunyasinda one cikan bir motordur.

### 1.2 Ozellikler

- **18+ Modchart Modifier**: Notalarin hareketini, gorunurlugunu ve efektlerini degistirmek icin genis yelpaze
- **13+ Shader**: Goruntu efektleri icin cesitli shader'lar
- **8+ Built-in Editor**: Character, stage, note, dialog, week, modchart, shader ve options editörleri
- **HScript Scripting**: Haxe dilinde script yazarak oyunu ozellestirme
- **Multi-Format Destek**: Psych Engine, Codename Engine, ve V-Slice formatlarini okuma
- **Custom Note NoteSkinleri**: Ozel nota goruntuleri ve efektleri
- **Dinamik Stage Sistemi**: JSON tabanli stage olusturma
- **Week Sistemi**: Story mode ve freeplay icin hafta yapilandirmasi
- **Dialog Sistemi**: Karakter diyalog ve cutscene sistemi
- **Character Sistemi**: Animasyonlu karakter olusturma
- **Ses Sistemi**: Muzik ve ses efekti yonetimi

### 1.3 Gereksinimler

Mod yapimi icin su gereksinimleri karsilamaniz gerekir:

- **Snail Engine**: Son surum Snail Engine (v1.0.0+)
- **Haxe**: Haxe 4.2.5+ kurulmus olmali
- **Haxelib**: Haxe kutuphane yoneticisi
- **IDE**: Visual Studio Code, Sublime Text veya baska bir kod editoru
- **Gorsel Duzenleyici**: Photoshop, GIMP veya baska bir gorsel duzenleyici
- **Ses Duzenleyici**: Audacity veya baska bir ses duzenleyici
- **Chart Editor**: Snail Engine icideki chart editor'u veya baska bir FNF chart editor'u

### 1.4 Kurulum

1. Snail Engine'i indirin ve kurun
2. Haxe'i indirin ve kurun
3. Haxelib'i kurun
4. Gerekli kutuphaneleri yukleyin
5. IDE'nizi ayarlayin

---

## Bolum 2: Mod Yapisi (GERCEK YAPI)

### 2.1 Ana Klasor Yapisi

Snail Engine modlari `content/` klasorunde bulunur. Her mod kendi klasorune sahiptir:

```
content/
├── my-mod/                    ← Senin modun
│   ├── meta.json              ← Mod meta verileri
│   ├── data/                  ← Oyun verileri
│   ├── songs/                 ← SARKILAR BURADA!
│   ├── images/                ← Gorseller
│   ├── sounds/                ← Ses efektleri
│   ├── music/                 ← Arka plan muzikleri
│   ├── shaders/               ← Shader dosyalari
│   └── scripts/               ← Script'ler
├── base-game-main/            ← Ana oyun icerigi
└── ...
```

### 2.2 ONEMLI: Sarki Yeri

**SARKILAR `data/songs/` DEGIL, `songs/` KLASORUNDEDIR!**

```
my-mod/
├── songs/                     ← SARKILAR BURADA
│   ├── my-song/
│   │   ├── audio/             ← Ses dosyalari
│   │   ├── charts/            ← Chart dosyalari
│   │   ├── meta.json          ← Sarki bilgileri
│   │   └── info.txt           ← Eski format bilgi
│   └── ...
└── data/                      ← Diger veriler
    ├── characters/
    ├── stages/
    └── ...
```

### 2.3 Meta JSON Yapisi

```json
{
    "name": "My Mod",                    // Mod adi
    "description": "My awesome mod",      // Aciklama
    "global": false,                     // Global mod mu?
    "windowTitle": "Friday Night Funkin' - My Mod",  // Pencere basligi
    "iconFile": "UI/icon64",             // Ikon dosyasi
    "defaultTransition": "swipe"         // Varsayilan gecis efekti
}
```

### 2.4 Tam Klasor Agaci

```
my-mod/
├── meta.json
├── README.md
│
├── data/
│   ├── characters/
│   │   ├── bf.json
│   │   ├── dad.json
│   │   ├── gf.json
│   │   └── my-character.json
│   ├── stages/
│   │   ├── stage/
│   │   │   ├── data.json
│   │   │   └── script.hx
│   │   └── mystage/
│   │       ├── data.json
│   │       └── script.hx
│   ├── weeks/
│   │   ├── tutorial.json
│   │   ├── week1.json
│   │   └── my-week.json
│   ├── noteskins/
│   │   └── default.json
│   ├── notetypes/
│   │   └── my-notetype.hx
│   ├── events/
│   │   └── event-list.txt
│   ├── dialogue/
│   │   └── my-dialogue/
│   │       └── dialogue.txt
│   ├── scripts/
│   │   └── pixelUI.hx
│   └── freeplay.json
│
├── songs/
│   ├── tutorial/
│   │   ├── audio/
│   │   │   ├── Inst.ogg
│   │   │   └── Voices.ogg
│   │   ├── charts/
│   │   │   ├── easy.json
│   │   │   ├── normal.json
│   │   │   └── hard.json
│   │   ├── meta.json
│   │   └── info.txt
│   └── my-song/
│       ├── audio/
│       │   ├── Inst.ogg
│       │   ├── Voices.ogg
│       │   ├── Voices-opp.ogg
│       │   └── Voices-player.ogg
│       ├── charts/
│       │   ├── easy.json
│       │   ├── normal.json
│       │   ├── hard.json
│       │   └── events.json
│       ├── meta.json
│       └── info.txt
│
├── images/
│   ├── backgrounds/
│   │   ├── stageback.png
│   │   ├── stagefront.png
│   │   ├── stagecurtains.png
│   │   ├── christmas/
│   │   ├── limo/
│   │   ├── philly/
│   │   └── tank/
│   ├── characters/
│   │   ├── bf.png
│   │   ├── bf.xml
│   │   ├── Dad_MF.png
│   │   ├── Dad_MF.xml
│   │   └── ...
│   ├── cutscenes/
│   │   └── my-cutscene/
│   │       ├── Animation.json
│   │       ├── spritemap1.json
│   │       └── spritemap1.png
│   ├── menus/
│   │   └── story/
│   │       ├── bgs/
│   │       ├── characters/
│   │       └── weeks/
│   ├── pixelUI/
│   │   ├── dialogueBox-pixel.png
│   │   ├── senpaiPortrait.png
│   │   └── ...
│   └── UI/
│       ├── icon64.png
│       ├── icons/
│       │   ├── icon-bf.png
│       │   └── icon-dad.png
│       └── notes/
│           ├── NOTE_assets.png
│           ├── NOTE_assets.xml
│           ├── noteSplashes-vanilla.png
│           ├── noteSplashes-vanilla.xml
│           ├── holdCover.png
│           └── holdCover.xml
│
├── sounds/
│   ├── Miss note.ogg
│   ├── Hit note.ogg
│   ├── thunder_1.ogg
│   └── ...
│
├── music/
│   ├── DISTORTO.ogg
│   ├── klaskii-romper.ogg
│   └── ...
│
├── shaders/
│   ├── adjustColor.frag
│   ├── rain.frag
│   └── my-shader.frag
│
└── scripts/
    ├── global.hx
    ├── myplaystate.hx
    ├── modifiers/
    │   ├── example-modifier.hx
    │   └── my-modifier.hx
    └── states/
        └── my-state.hx
```

---

## Bolum 3: Character Olusturma

### 3.1 Character Nedir?

Character, oyundaki NPC veya oyuncu character'idir. Her character'in animasyonlari, goruntusu ve ozellikleri vardir.

### 3.2 Character JSON Yapisi

```json
{
    "animations": [                    // Animation listesi
        {
            "anim": "idle",           // Animation adi
            "name": "BF idle dance",  // Spritesheet'teki prefix
            "fps": 24,                // FPS degeri
            "loop": false,            // Loop yapisi
            "offsets": [-2, -2],      // [x, y] offset degerleri
            "indices": []             // Frame sirasi
        }
    ],
    "image": "characters/bf",         // Spritesheet yolu
    "scale": 1,                       // Olcek
    "sing_duration": 4,               // Sing pose suresi
    "healthicon": "bf",               // Health icon adi
    "position": [-10, 340],           // [x, y] character pozisyonu
    "camera_position": [30, -34],     // [x, y] kamera offset
    "flip_x": true,                   // Yatay cevirme
    "no_antialiasing": false,         // Pixel art modu
    "healthbar_colour": -13520687,    // Healthbar rengi
    "dance_every": 2,                 // Dance idle arasi beat
    "vslice_sustains": false          // Hold frame sonu
}
```

### 3.3 Zorunlu Animasyonlar

Character'in sahip olmasi gereken animasyonlar:

- `idle` - Duragan durus animasyonu
- `singLEFT` - Sol notasi animasyonu
- `singDOWN` - Asagi notasi animasyonu
- `singUP` - Yukari notasi animasyonu
- `singRIGHT` - Sag notasi animasyonu

Opsiyonel animasyonlar:
- `singLEFTmiss` - Sol kacirma animasyonu
- `singDOWNmiss` - Asagi kacirma animasyonu
- `singUPmiss` - Yukari kacirma animasyonu
- `singRIGHTmiss` - Sag kacirma animasyonu
- `hey` - Hey animasyonu (BF icin)
- `danceLeft` / `danceRight` - Alternatif idle (girlfriend icin)

### 3.4 Spritesheet Formatlari

#### PNG + XML (Sparrow Atlas)
```
images/characters/
├── bf.png
└── bf.xml
```
- En eski ve en yaygin format
- `Paths.getSparrowAtlas()` ile yuklenir

#### Animate Atlas
```
images/characters/darnellBlazin/
├── Animation.json
├── spritemap1.json
└── spritemap1.png
```
- Daha yeni format
- Buyuk animasyonlar icin ideal

#### Packer Atlas
```
images/characters/
├── spirit.txt
└── spirit.png
```
- En basit format

### 3.5 Character Script (.hx)

Bazi character'lar ozel script'ler ister:

```haxe
// data/characters/my-character.hx

// Nota tiplerini isle
function onNoteHit(note) {
    if (note.noteType == "myNoteType") {
        // Ozel nota islemi
    }
}
```

### 3.6 Offset Hesaplama

Offset degerleri character'in ekrandaki pozisyonunu ayarlamak icin kullanilir:

- `offsets[0]` = X ekseninde kayma (negatif = sola, pozitif = saga)
- `offsets[1]` = Y ekseninde kayma (negatif = yukari, pozitif = asagi)

### 3.7 Kamera Pozisyonu

`camera_position` degerleri character'in kamerada nerede gorunecegini belirler:

- `camera_position[0]` = Kamera X offset
- `camera_position[1]` = Kamera Y offset

### 3.8 Healthbar Rengi

`healthbar_colour` degeri character'in saglik cubugundaki rengi belirler:

- Hex deger olarak girilmelidir
- Ornegin: -13520687 veya 0xFF32CD32

---

## Bolum 4: Sarki Olusturma

### 4.1 ONEMLI: Sarki Yeri

**SARKILAR `data/songs/` DEGIL, `songs/` KLASORUNDEDIR!**

```
my-mod/
└── songs/                     ← SARKILAR BURADA
    └── my-song/
        ├── audio/             ← Ses dosyalari
        │   ├── Inst.ogg
        │   └── Voices.ogg
        ├── charts/            ← Chart dosyalari
        │   ├── easy.json
        │   ├── normal.json
        │   ├── hard.json
        │   └── events.json
        ├── meta.json          ← Sarki bilgileri
        └── info.txt           ← Eski format bilgi
```

### 4.2 Sarki Klasor Yapisi

```
songs/my-song/
├── audio/
│   ├── Inst.ogg               ← Ana sarki (zorunlu)
│   ├── Voices.ogg             ← Vokaller
│   ├── Voices-opp.ogg         ← Opponent vokal (opsiyonel)
│   └── Voices-player.ogg      ← Player vokal (opsiyonel)
├── charts/
│   ├── easy.json              ← Easy zorluk
│   ├── normal.json            ← Normal zorluk
│   ├── hard.json              ← Hard zorluk
│   └── events.json            ← Event'ler
├── meta.json                  ← Sarki bilgileri
└── info.txt                   ← Eski format bilgi
```

### 4.3 meta.json Yapisi

```json
{
    "songName": "my-song",              // Sarki adi
    "displayName": "My Song",           // Menu gosterim adi
    "composers": ["Your Name"],         // Besteciler
    "charters": ["Your Name"],          // Chart yazanlar
    "artists": ["Your Name"],           // Sanatcilar
    "coders": [],                       // Programcilar
    "difficulties": ["easy", "Normal", "hard"],  // Zorluk seviyeleri
    "freeplayColor": "#9271FD",         // Freeplay rengi
    "freeplayIcon": "bf"                // Freeplay ikonu
}
```

### 4.4 info.txt Yapisi

```
display name=My Song
artist=Your Name
arnings=
bpm=120
speed=1.8
needsVoices=1
```

### 4.5 Chart JSON Yapisi

```json
{
    "song": "my-song",                   // Sarki adi
    "notes": [],                         // Nota section'lari
    "events": [],                        // Event'ler
    "bpm": 120,                         // Beats per minute
    "needsVoices": true,                // Vokal dosyasi gerekli mi?
    "speed": 1.8,                       // Scroll hizi
    "keys": 4,                          // Nota sayisi per side
    "lanes": 2,                         // Toplam lane sayisi
    "player1": "bf",                    // BF character ID
    "player2": "dad",                   // Dad character ID
    "gfVersion": "gf",                  // GF character ID
    "stage": "stage",                   // Stage ID
    "arrowSkins": [""],                 // Nota skinleri
    "format": "nmv2"                    // Chart formati
}
```

### 4.6 Note Section Yapisi

Her section sunu icerir:

```json
{
    "sectionNotes": [                    // Nota listesi
        [1000, 0, 200],                  // [strumTime, noteData, sustainLength]
        [1250, 2, 0]                     // [strumTime, noteData, sustainLength]
    ],
    "mustHitSection": false,             // true = opponent, false = player
    "sectionBeats": 4,                   // Section'taki beat sayisi
    "gfSection": false,                  // GF section mu?
    "bpm": 120,                          // Bu section'da BPM degisimi
    "changeBPM": false,                  // BPM degisiyor mu?
    "altAnim": false                     // Alternatif animasyon kullan
}
```

### 4.7 Note Formati

`sectionNotes` icindeki her nota:
```
[strumTime, noteData, sustainLength]
```

- `strumTime`: Notanin gorunme zamani (milisaniye)
- `noteData`: Nota pozisyonu (0=sol, 1=asagi, 2=yukari, 3=sag)
- `sustainLength`: Hold notasi uzunlugu (0 = kisa not)

### 4.8 Nota Hesaplama

Notalarin zamani su formulle hesaplanir:
```
strumTime = (beatNumber * (60000 / bpm))
```

Ornek 120 BPM icin:
- 1 beat = 500ms
- 4 beat (1 section) = 2000ms

### 4.9 Events

Event'ler sarki sirasinda yapilan degisikliklerdir:

```json
[
    [1000, [["Change Character", "dad", "angry-dad"]]],
    [5000, [["Play Animation", "singUP", "bf"]]]
]
```

### 4.10 Zorluk Seviyeleri

Her zorluk icin ayri bir JSON dosyasi olusturun:
- `charts/easy.json` - Kolay
- `charts/normal.json` - Normal
- `charts/hard.json` - Zor

Her dosya ayni formati kullanir, sadece `speed` ve `notes` degerleri degisir.

### 4.11 Sarki Ses Dosyalari

Sarki ses dosyalari su yerlerde bulunur:
- `songs/my-song/audio/Inst.ogg` - Ana sarki
- `songs/my-song/audio/Voices.ogg` - Vokaller
- `songs/my-song/audio/Voices-opp.ogg` - Opponent vokal (opsiyonel)
- `songs/my-song/audio/Voices-player.ogg` - Player vokal (opsiyonel)

---

## Bolum 5: Stage Olusturma

### 5.1 Stage Nedir?

Stage, sarki sirasinda arka plan olarak kullanilan gorsel ve objelerdir.

### 5.2 Stage Klasor Yapisi

```
data/stages/
├── mystage/
│   ├── data.json               ← Stage verileri
│   └── script.hx               ← Stage scripti
└── stage/
    ├── data.json
    └── script.hx
```

### 5.3 data.json Yapisi

```json
{
    "defaultZoom": 0.9,                  // Kamera zoom
    "isPixelStage": false,               // Pixel art stage mi?
    "boyfriend": [770, 100],             // [x, y] BF pozisyonu
    "girlfriend": [400, 130],            // [x, y] GF pozisyonu
    "opponent": [100, 100],              // [x, y] Dad pozisyonu
    "hide_girlfriend": false,            // GF gizleme
    "camera_boyfriend": [0, 0],          // [x, y] BF kamera offset
    "camera_opponent": [0, 0],           // [x, y] Dad kamera offset
    "camera_girlfriend": [0, 0],         // [x, y] GF kamera offset
    "camera_speed": 1,                   // Kamera hareket hizi
    "dadZIndex": 3,                      // Dad Z-index
    "bfZIndex": 3,                       // BF Z-index
    "gfZIndex": 3,                       // GF Z-index
    "stageObjects": []                   // Arka plan objeleri
}
```

### 5.4 StageObject Yapisi

```json
{
    "id": "bg",                          // Object ID
    "asset": "stageback",                // Gorsel yolu
    "position": [-600, -200],            // [x, y] Pozisyon
    "scrollFactor": [1, 1],              // [x, y] Parallax
    "scale": [1, 1],                     // [x, y] Olcek
    "alpha": 1,                          // Saydamlik
    "flipX": false,                      // Yatay cevirme
    "flipY": false,                      // Dikey cevirme
    "zIndex": 1,                         // Katman sirasi
    "angle": 0,                          // Rotasyon
    "colour": null,                      // Renk filtresi
    "blend": null,                       // Blend modu
    "antialiasing": true,                // Antialiasing
    "highQuality": true,                 // Yuksek kalite
    "customInstance": null,              // Ozel class
    "animations": [],                    // Animasyonlar
    "advancedCalls": [],                 // Gelismis cagirilar
    "setProperties": []                  // Ozellik ayarlari
}
```

### 5.5 Arka Plan Gorselleri

Gorselleri `images/backgrounds/` klasorune koyun:
- `stageback.png` - Arka plan
- `stagefront.png` - On plan
- `stagecurtains.png` - Perde

### 5.6 Animasyonlu Obje Ornegini

```json
{
    "id": "bg",
    "asset": "backgrounds/week2/halloween_bg",
    "position": [-200, -100],
    "scale": [1.1, 1.1],
    "animations": [
        {
            "anim": "idle",
            "name": "halloweem bg0",
            "fps": 24,
            "loop": false
        },
        {
            "anim": "lightning",
            "name": "halloweem bg lightning strike",
            "fps": 24,
            "loop": false
        }
    ]
}
```

### 5.7 Stage Script (script.hx)

```haxe
function onCreate() {
    trace("Stage yuklendi!");
}

function onBeatHit() {
    if (curBeat % 4 == 0) {
        bg.animation.play("lightning");
    }
}

function onUpdate(elapsed) {
    // Frame guncelleme
}
```

---

## Bolum 6: Week Olusturma

### 6.1 Week Nedir?

Week, story mode'da bir dizi sarkiyi temsil eder. Her week'in sarkilari, character'lari ve ozellikleri vardir.

### 6.2 Week JSON Yapisi

```json
{
    "songs": [                            // Sarki listesi
        ["my-song", "dad", [146, 113, 253]]
    ],
    "weekCharacters": ["dad", "bf", "gf"],  // Menu character'leri
    "weekBackground": "stage",             // Stage ID
    "weekBefore": "",                      // Onceki week ID'si
    "storyName": "My Custom Week",         // Story mode basligi
    "weekName": "Week Template",           // Menu gosterim adi
    "freeplayColor": [146, 113, 253],      // Freeplay rengi
    "startUnlocked": true,                 // Baslangicta acik mi?
    "hiddenUntilUnlocked": false,          // Acilana kadar gizli mi?
    "hideStoryMode": false,                // Story mode'dan gizle
    "hideFreeplay": false                  // Freeplay'den gizle
}
```

### 6.3 Sarki Listesi Formati

Her sarki su formatta olmalidir:
```json
["sarkiAdi", "opponentCharacterID", [r, g, b]]
```

### 6.4 Week Character'leri

`weekCharacters` dizisi 3 eleman icerir:
- `weekCharacters[0]`: Sol taraftaki character (genelde opponent)
- `weekCharacters[1]`: Ortadaki character (genelde BF)
- `weekCharacters[2]`: Sag taraftaki character (genelde GF)

---

## Bolum 7: Noteskin Olusturma

### 7.1 Noteskin Nedir?

Noteskin, notalarin gorunusunu belirler. Her notskin'in nota, receptor ve splash animasyonlari vardir.

### 7.2 Noteskin JSON Yapisi

```json
{
    "noteTexture": "UI/notes/NOTE_assets",           // Nota spritesheet'i
    "splashTexture": "UI/notes/noteSplashes-vanilla", // Splash spritesheet'i
    "sustainSplashTexture": "UI/notes/holdCover",    // Sustain splash spritesheet
    "antialiasing": true,                            // Antialiasing
    "singAnimations": [                              // Sing animasyonlari
        "singLEFT",
        "singDOWN",
        "singUP",
        "singRIGHT"
    ],
    "noteScale": 0.7,                                // Nota olcegi
    "splashScale": 1,                                // Splash olcegi
    "inGameColoring": true,                          // Oyun ici renklendirme
    "splashesEnabled": true,                         // Splash efektleri acik
    "susSplashesEnabled": true                       // Sustain splash acik
}
```

---

## Bolum 8: Scripting (HScript)

### 8.1 Scripting Nedir?

Scripting, Haxe dilinde yazilan script'ler ile oyunu ozellestirme yontemidir.

### 8.2 Script Yerleri

Script'lerin konacagi yerler:
- `scripts/global.hx` - Global script
- `scripts/myplaystate.hx` - PlayState scripti
- `data/stages/mystage/script.hx` - Stage scripti
- `scripts/modifiers/my-modifier.hx` - Modifier scripti
- `data/characters/my-character.hx` - Character scripti

### 8.3 Global Script Ornegi

```haxe
// scripts/global.hx

function onCreate() {
    trace("Global script yuklendi!");
}

function onUpdate(elapsed) {
    // Frame guncelleme
}

function onBeatHit() {
    // Beat guncelleme
}

function onSongStart() {
    trace("Sarki basladi!");
}

function onEndSong() {
    trace("Sarki bitti!");
    return 0;
}

function onNoteHit(note) {
    // Nota vurma
}

function onNoteMiss(note) {
    // Nota kacirma
}
```

### 8.4 PlayState Script Ornegi

```haxe
// scripts/myplaystate.hx

function onCreate() {
    trace("PlayState script yuklendi!");
    trace("Sarki: " + songName);
    trace("BPM: " + bpm);
    trace("Scroll Hizi: " + scrollSpeed);
}

function onUpdate(elapsed) {
    // Frame guncelleme
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
```

### 8.5 Stage Script Ornegi

```haxe
// data/stages/mystage/script.hx

function onCreate() {
    trace("Stage script yuklendi!");
}

function onBeatHit() {
    if (curBeat % 4 == 0) {
        bg.animation.play("lightning");
    }
}

function onUpdate(elapsed) {
    // Frame guncelleme
}
```

### 8.6 Script Fonksiyonlari

Her script su fonksiyonlari icerir:

#### Tum Script'ler
- `onCreate()` - Olusturma
- `onUpdate(elapsed)` - Frame guncelleme
- `onDestroy()` - Temizlik

#### PlayState Scriptleri
- `onBeatHit()` - Beat guncelleme
- `onStepHit()` - Step guncelleme
- `onNoteHit(note)` - Nota vurma
- `onNoteMiss(note)` - Nota kacirma
- `onNoteCreation(note)` - Nota olusturma
- `onEvent(name, value1, value2)` - Event calistirma
- `onSectionHit()` - Section degisimi
- `onStartCountdown()` - Countdown baslangici
- `onSongStart()` - Sarki baslangici
- `onEndSong()` - Sarki bitisi

### 8.7 Mevcut Degiskenler

Her script su degiskenlere erisebilir:

#### Genel
- `Math` - Matematik fonksiyonlari
- `Std` - Standart fonksiyonlar
- `StringTools` - String araclar
- `Type` - Tip fonksiyonlari

#### Flixel
- `FlxG` - Ana Flixel sinifi
- `FlxSprite` - Sprite sinifi
- `FlxCamera` - Kamera sinifi
- `FlxMath` - Matematik fonksiyonlari
- `FlxTimer` - Timer sinifi
- `FlxTween` - Tween sinifi
- `FlxEase` - Ease fonksiyonlari
- `FlxSound` - Ses sinifi
- `FlxText` - Text sinifi
- `FlxRuntimeShader` - Runtime shader

#### FNF
- `Paths` - Yol fonksiyonlari
- `MusicBeatState` - Beat state
- `Conductor` - Conductor sinifi
- `ClientPrefs` - Tercihler
- `CoolUtil` - Havaclik araclar
- `PlayState` - Oyun durumu
- `FunkinSound` - Ses sinifi

---

## Bolum 9: Modchart Sistemi

### 9.1 Modchart Nedir?

Modchart, notalarin hareketini, gorunurlugunu veya diger ozelliklerini degistiren efektlerdir.

### 9.2 Built-in Modifier'lar

| # | Modifier | Aciklama |
|---|----------|----------|
| 1 | reverse | Notalari ters cevirir |
| 2 | confusion | Notalari dondurur |
| 3 | opponentSwap | Oyuncu degisimi |
| 4 | flip | Notalari yatay cevirir |
| 5 | invert | Notalari degistirir |
| 6 | drunk | Notalari sarhoş eder |
| 7 | beat | Notalari beat ile hareket ettirir |
| 8 | stealth | Notalari gorunmez yapar |
| 9 | receptorScroll | Receptor kayma |
| 10 | mini | Notalari kucultur |
| 11 | transformX | Nota pozisyon degisimi |
| 12 | infinite | Sonsuz path |
| 13 | boost | Hizlandirma |
| 14 | xmod | Scroll hizi kontrolu |
| 15 | rotateX | 3D dondurme |

### 9.3 Script Modifier Olusturma

```haxe
// scripts/modifiers/my-modifier.hx

function getName() {
    return "myModifier";
}

function getModType() {
    return "NOTE_MOD";
}

function getOrder() {
    return 0;
}

function getPos(time, diff, tDiff, beat, pos, data, player, obj) {
    pos.x += 50;
    pos.y += Math.sin(beat * 2) * 30;
    return pos;
}
```

---

## Bolum 10: Shader Sistemi

### 10.1 Shader Nedir?

Shader'lar goruntuyu islemek icin kullanilan programlardir.

### 10.2 Shader Yeri

Shader'lar `shaders/` klasorunde bulunur:
```
shaders/
├── adjustColor.frag
├── rain.frag
└── my-shader.frag
```

### 10.3 Shader Ornegi

```glsl
// shaders/my-shader.frag

uniform sampler2D uTexture;
uniform float uTime;
varying vec2 vTextureCoord;

void main() {
    vec4 color = texture2D(uTexture, vTextureCoord);
    color.r = sin(uTime) * 0.5 + 0.5;
    color.g = cos(uTime) * 0.5 + 0.5;
    gl_FragColor = color;
}
```

---

## Bolum 11: Event Sistemi

### 11.1 Event Nedir?

Event'ler sarki sirasinda yapilan degisikliklerdir.

### 11.2 Desteklenen Event'ler

| Event | Aciklama |
|-------|----------|
| Change Character | Character degistirme |
| Play Animation | Animasyon oynatma |
| Add Camera Zoom | Kamera zoom ekleme |
| Kill Henchmen | Dusman oldurme |
| BG Freaks Expression | Arka plan ifadesi degisimi |

### 11.3 Event Formati

```json
[
    1000,
    [
        ["Change Character", "dad", "angry-dad"],
        ["Play Animation", "singUP", "bf"]
    ]
]
```

---

## Bolum 12: Dialog Sistemi

### 12.1 Dialog Nedir?

Dialog, character'lar arasi diyalog ve cutscene'lerdir.

### 12.2 Dialog Formati

```
":characterName: dialogue text"
```

### 12.3 Dialog Ornegi

```
:bf: Hey!
:senpai: Selam!
:bf: Nasilsin?
:senpai: Iyiyim, tesekkurler!
```

---

## Bolum 13: Mod Yuku

1. Mod klasorunu `content/` altina koyun
2. Oyuna girin
3. TAB tusuna basin (Mods menusu)
4. Modu aktif edin

---

## Bolum 14: Sik Sorulan Sorular

### 1. Sarki nerede?
`songs/` klasorunde! `data/songs/` DEGIL!

### 2. Character nerede?
`data/characters/` klasorunde `.json` dosyalari olarak.

### 3. Stage nerede?
`data/stages/` klasorunde her biri icin ayri klasor olarak.

### 4. Script nerede?
- Global: `scripts/` klasorunde
- Stage: `data/stages/mystage/script.hx`
- Modifier: `scripts/modifiers/` klasorunde

### 5. Shader nerede?
`shaders/` klasorunde `.frag` dosyalari olarak.

### 6. Ses dosyalari nerede?
- Sarki sesleri: `songs/my-song/audio/`
- Ses efektleri: `sounds/`
- Muzikler: `music/`

### 7. Gorseller nerede?
- Character: `images/characters/`
- Stage: `images/backgrounds/`
- UI: `images/UI/`

---

## Ek: Tam Klasor Yapisi

```
content/my-mod/
├── meta.json
├── README.md
├── data/
│   ├── characters/
│   │   ├── bf.json
│   │   ├── dad.json
│   │   ├── gf.json
│   │   └── my-character.json
│   ├── stages/
│   │   ├── stage/
│   │   │   ├── data.json
│   │   │   └── script.hx
│   │   └── mystage/
│   │       ├── data.json
│   │       └── script.hx
│   ├── weeks/
│   │   ├── tutorial.json
│   │   └── my-week.json
│   ├── noteskins/
│   │   └── default.json
│   ├── notetypes/
│   │   └── my-notetype.hx
│   ├── events/
│   │   └── event-list.txt
│   ├── dialogue/
│   │   └── my-dialogue/
│   │       └── dialogue.txt
│   ├── scripts/
│   │   └── pixelUI.hx
│   └── freeplay.json
├── songs/
│   ├── tutorial/
│   │   ├── audio/
│   │   │   ├── Inst.ogg
│   │   │   └── Voices.ogg
│   │   ├── charts/
│   │   │   ├── easy.json
│   │   │   ├── normal.json
│   │   │   └── hard.json
│   │   ├── meta.json
│   │   └── info.txt
│   └── my-song/
│       ├── audio/
│       │   ├── Inst.ogg
│       │   └── Voices.ogg
│       ├── charts/
│       │   ├── easy.json
│       │   ├── normal.json
│       │   ├── hard.json
│       │   └── events.json
│       ├── meta.json
│       └── info.txt
├── images/
│   ├── backgrounds/
│   │   ├── stageback.png
│   │   ├── stagefront.png
│   │   └── stagecurtains.png
│   ├── characters/
│   │   ├── bf.png
│   │   ├── bf.xml
│   │   ├── Dad_MF.png
│   │   └── Dad_MF.xml
│   ├── cutscenes/
│   │   └── my-cutscene/
│   │       ├── Animation.json
│   │       ├── spritemap1.json
│   │       └── spritemap1.png
│   ├── menus/
│   │   └── story/
│   │       ├── bgs/
│   │       ├── characters/
│   │       └── weeks/
│   ├── pixelUI/
│   │   ├── dialogueBox-pixel.png
│   │   └── senpaiPortrait.png
│   └── UI/
│       ├── icon64.png
│       ├── icons/
│       │   ├── icon-bf.png
│       │   └── icon-dad.png
│       └── notes/
│           ├── NOTE_assets.png
│           ├── NOTE_assets.xml
│           ├── noteSplashes-vanilla.png
│           └── holdCover.png
├── sounds/
│   ├── Miss note.ogg
│   └── Hit note.ogg
├── music/
│   └── DISTORTO.ogg
├── shaders/
│   ├── adjustColor.frag
│   ├── rain.frag
│   └── my-shader.frag
└── scripts/
    ├── global.hx
    ├── myplaystate.hx
    └── modifiers/
        └── my-modifier.hx
```

---

Bu documentary Snail Engine modding'inin tam kapsamli rehberidir. Her bolum detayli bilgi ve ornekler icerir.
