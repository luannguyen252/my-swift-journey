//
//  PresentModifier.swift
//  SwiftUI-FullModal
//
//  Created by Klemen Košir on 11/04/2020.
//  Copyright © 2020 Klemen Košir. All rights reserved.
//

import SwiftUI

fileprivate struct FullModal<PresentedView: View>: ViewModifier {
	
	@Binding var isPresented: Bool
	let presentedView: PresentedView
	let style: ModalAnimationStyle
	
	func body(content: Content) -> some View {
		GeometryReader { geometry in
			ZStack {
				ZStack {
					content
				}
				ZStack {
					Color.clear.edgesIgnoringSafeArea(.all)
					self.presentedView
				}
				.offset(x: 0, y: self.yOffset(geometry))
				.opacity(self.opacity)
			}
		}
	}
	
	private func yOffset(_ geometry: GeometryProxy) -> CGFloat {
		switch style {
		case .none, .fade:
			return 0
		case .slide:
			return isPresented ? 0 : viewHeight(geometry)
		}
	}
	
	private var opacity: Double {
		switch style {
		case .none, .slide:
			return 1
		case .fade:
			return isPresented ? 1 : 0
		}
	}
	
	private func viewHeight(_ proxy: GeometryProxy) -> CGFloat {
		proxy.size.height + proxy.safeAreaInsets.top + proxy.safeAreaInsets.bottom
	}
	
}

/// Defines all the animation styles
enum ModalAnimationStyle {
	/// View will present without animation
	case none
	
	/// View will present by sliding from the bottom
	case slide
	
	/// View will fade in/out
	case fade
}

extension View {
	
	/// Presents a view like the old UIKit function to present a view controller `present()`
	func present<Content: View>(_ isPresented: Binding<Bool>, view: Content, style: ModalAnimationStyle = .slide) -> some View {
		self.modifier(FullModal(isPresented: isPresented, presentedView: view, style: style))
				.animation(style != .none ? .easeInOut : .none)
	}
	
}
