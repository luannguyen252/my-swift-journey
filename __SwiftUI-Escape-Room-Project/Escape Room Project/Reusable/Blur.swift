//
//  Blur.swift
//  Created by Julian Schiavo on 7/5/2020.
//  Copyright © 2020 Julian Schiavo. All rights reserved.
//

import SwiftUI

/// Custom made blur effect in SwiftUI
public struct Blur: View {
    enum Style {
        case systemUltraThinMaterial
        case systemThinMaterial
        case systemMaterial
        case systemThickMaterial
        case systemChromeMaterial
        
        #if os(iOS)
        var style: UIBlurEffect.Style {
            switch self {
            case .systemUltraThinMaterial: return .systemUltraThinMaterialDark
            case .systemThinMaterial: return .systemThinMaterialDark
            case .systemMaterial: return .systemMaterialDark
            case .systemThickMaterial: return .systemThickMaterialDark
            case .systemChromeMaterial: return .systemChromeMaterialDark
            }
        }
        #elseif os(macOS)
        var material: NSVisualEffectView.Material {
            .contentBackground
        }
        #endif
    }
    
    var style: Style = .systemMaterial
    
    public var body: some View {
        #if os(iOS)
        return UnderlyingBlur(style: style.style)
        #elseif os(macOS)
        return UnderlyingBlur(material: style.material)
        #endif
    }
}

#if os(iOS)
import UIKit

struct UnderlyingBlur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemMaterial
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}

#elseif os(macOS)
import Cocoa

struct UnderlyingBlur: NSViewRepresentable {
    var material: NSVisualEffectView.Material = .contentBackground
    
    func makeNSView(context: Context) -> NSVisualEffectView {
        let view = NSVisualEffectView()
        view.material = material
        return view
    }
    
    func updateNSView(_ nsView: NSVisualEffectView, context: Context) {
        nsView.material = material
    }
}
#endif

