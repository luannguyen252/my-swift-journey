//
//  PurchaseButtonState.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 08/10/2020.
//

import SwiftUI

enum PurchaseButtonState {
    case get(isDownloaded: Bool)
    case preparingToDownload
    case downloading(progress: Double)
    case open
    
    var properties: ButtonStyleProperties {
        switch self {
        case .get(isDownloaded: let isDownloaded):
            return GetButtonStyleProperties(isDownloaded: isDownloaded)
        case .preparingToDownload:
            return PreparingToDownloadButtonStyleProperties()
        case .downloading:
            return DownloadingButtonStyleProperties()
        case .open:
            return OpenButtonStyleProperties()
        }
    }
}
