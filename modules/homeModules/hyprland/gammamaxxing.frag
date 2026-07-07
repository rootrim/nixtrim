#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;
out vec4 fragColor;

const float GAMMA = 0.8;
const float BRIGHTNESS = 0.15;

void main() {
    vec4 pixColor = texture(tex, v_texcoord);

    vec3 corrected = pow(pixColor.rgb, vec3(GAMMA));
    corrected += BRIGHTNESS;
    corrected = clamp(corrected, 0.0, 1.0);

    fragColor = vec4(corrected, pixColor.a);
}
