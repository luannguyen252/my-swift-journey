//
//  Shaders.swift
//  StellarSystem
//
//  Created by Malik, Alayli on 2019/10/02.
//  Copyright © 2019 Malik Alayli. All rights reserved.
//

import Foundation

let appearingFragmentShader =
"""
#pragma arguments

float revealage;
texture2d<float, access::sample> noiseTexture;

#pragma transparent
#pragma body

const float edgeWidth = 0.02;
const float edgeBrightness = 2;
const float3 innerColor = float3(0.4, 0.8, 1);
const float3 outerColor = float3(0, 0.5, 1);
const float noiseScale = 3;

constexpr sampler noiseSampler(filter::linear, address::repeat);
float2 noiseCoords = noiseScale * _surface.ambientTexcoord;
float noiseValue = noiseTexture.sample(noiseSampler, noiseCoords).r;

if (noiseValue > revealage) {
discard_fragment();
}

float edgeDist = revealage - noiseValue;
if (edgeDist < edgeWidth) {
float t = edgeDist / edgeWidth;
float3 edgeColor = edgeBrightness * mix(outerColor, innerColor, t);
_output.color.rgb = edgeColor;
}
"""
