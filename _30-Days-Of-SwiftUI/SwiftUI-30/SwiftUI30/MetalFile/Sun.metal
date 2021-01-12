#include <metal_stdlib>
using namespace metal;

float distanceToCenter(float2 point, float2 center, float radius) {
    return length(point - center) - radius;
}

float smoothStep(float e1, float e2, float x) {
    x = clamp((x - e1) / (e2 - e1), 0.0, 1.0);
    return x * x * x * (x * (x * 6 - 15) + 10);
}

kernel void compute(texture2d<float, access:: write> output [[texture(0)]], uint2 gid [[thread_position_in_grid]]) {
    int width = output.get_width();
    int height = output.get_height();
    int minLength = min(width, height);
    int widthGap = (width - minLength) / 2;
    int heightGap = (height - minLength) / 2;
    float red = float(gid.x) / float(width);
    float green = float(gid.y) / float(height);
    float2 uv = float2(gid.x, gid.y) / float2(minLength, minLength);
    float2 center = float2(float(widthGap) / float(minLength) + 0.5, float(heightGap) / float(minLength) + 0.5);
    float radius = 0.25;
    float dis = distanceToCenter(uv, center, radius);
    float factor = 1.0 / (1.0 + 5 * dis * dis + 4 * dis);
    float m = smoothStep(radius - 0.005, radius + 0.005,1 - factor);
    float4 black = float4(0);
    float4 color = float4(red,green,1,1) * factor;
    output.write(mix(black, color, m), gid);
}
