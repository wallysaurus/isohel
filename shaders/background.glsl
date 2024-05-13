# version 460 core

#include <flutter/runtime_effect.glsl>

// Uniforms
uniform vec2 u_resolution;

// Out??
out vec4 fragColor;

// Constants
vec2 u_coords = vec2(u_resolution.x/2, u_resolution.y/2);
float u_radius = 25;

void main() {

  vec2 currentPos = FlutterFragCoord().xy;
  vec4 color = vec4(0.0);
  
  vec2 circleCenter = (u_coords * 2.0 - 1.0);
  float dist = distance(currentPos, circleCenter);
  if (dist < u_radius) {
    color = vec4(1.0);
  }

  fragColor = color;

}