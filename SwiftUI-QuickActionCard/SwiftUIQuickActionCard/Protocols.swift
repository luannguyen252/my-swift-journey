//
//  Protocols.swift
//  SwiftUIQuickActionCard
//
//  Created by Luan Nguyen on 30/12/2020.
//

import SwiftUI

internal protocol CardViewModifiers {
    func overlayUIScreen() -> Self
    func enableHapticFeedback() -> Self
    func tapToDismiss() -> Self
    func dismissButton() -> Self
    func cardCornerRadius(_ cornerRadius: CGFloat) -> Self
    func cardPadding(_ padding: CGFloat) -> Self
}

internal protocol Properties {
    var cornerRadius: CGFloat { get set }
    var cardPadding: CGFloat { get set }
    var shouldHapticTapOnAppear: Bool { get set }
    var hasDismissButton: Bool { get set }
    var shouldDismissOntap: Bool { get set }
    var overlaysUIScreen: Bool { get set }
}
