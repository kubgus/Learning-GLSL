#version 430

out vec4 fragColor;

uniform vec2 u_resolution;
uniform float u_time;

float time = u_time * 0.1;

vec3 colorize(vec3 col, vec3 mod) {
    col.x *= mod.x;
    col.y *= mod.y;
    col.z *= mod.z;

    return col;
}

void main() {
    vec2 uv = (gl_FragCoord.xy - 0.5 * u_resolution.xy) / u_resolution.y;
    vec3 col = vec3(0.0);

    float l = 200.0;
    for (float i=0.0; i<l; i++) {
        col += 0.001 / length(vec2(uv.x+0.8-(i/l)*1.61, uv.y + sin(time * i * 0.1) * 0.45));
    }

    fragColor = vec4(colorize(col, vec3(0.2, 0.5, 0.8)), 1.0);
}