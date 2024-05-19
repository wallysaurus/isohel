# version 460 core
#include <flutter/runtime_effect.glsl>

out vec4 fragColor;

uniform vec2 uRes;

vec4 circle(vec2 uv, vec2 pos, float rad, vec3 color) {
    float d = length(pos - uv);
    float t = smoothstep(rad, rad + 0.01, d);
    return vec4(color, 1.0 - t);
}

vec3 rgb(float r, float g, float b) {
    return vec3(r / 255.0, g / 255.0, b / 255.0);
}

void main() {

    vec3 bgColor = vec3(0.0);

    float radius = 50;
    vec4 color = circle(FlutterFragCoord().xy, vec2(100.0, 100.0), radius, rgb(0.0, 255.0, 0.0));
    
    fragColor = mix(vec4(bgColor, 1.0), color, color.a);

}