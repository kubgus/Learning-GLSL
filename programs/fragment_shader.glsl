#version 430

out vec4 fragColor;

uniform vec2 u_resolution;
uniform float u_time;

const float PI = acos(-1.0);

float time = u_time * 0.01;

vec3 colorize(vec3 col, vec3 mod) {
    col.x *= mod.x;
    col.y *= mod.y;
    col.z *= mod.z;

    return col;
}

void main() {
    vec2 uv = (gl_FragCoord.xy - 0.5 * u_resolution.xy) / u_resolution.y;
    vec3 col = vec3(0.0);

    float r = 0.3;
    float l = 1000.0;
    for (float i=0.0; i<l; i++) {
        col += 0.0001 / length(vec2(uv.x - r * sin(time * i) * cos(PI/l*i*2), uv.y - r * cos(time * i) * sin(PI/l*i*2)));
    }

    fragColor = vec4(colorize(col, vec3(0.3, 0.3, 0.8)), 1.0);
}