// Ornek shader fragment
// Bu dosyayi shaders/ klasorune koyun

uniform sampler2D uTexture;
uniform float uTime;
varying vec2 vTextureCoord;

void main() {
    vec4 color = texture2D(uTexture, vTextureCoord);
    color.r = sin(uTime) * 0.5 + 0.5;
    color.g = cos(uTime) * 0.5 + 0.5;
    gl_FragColor = color;
}
