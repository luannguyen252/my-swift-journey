//
//  PurchaseButtonViewModel.swift
//  PurchaseButton
//
//  Created by Pablo Blanco González on 16/10/2020.
//

import Foundation

class PurchaseButtonViewModel: ObservableObject {
    
    @Published var state: PurchaseButtonState
    var isDownloaded: Bool
    var isDone: Bool
    
    init(isDone: Bool, isDownloaded: Bool) {

        self.isDone = isDone
        self.isDownloaded = isDownloaded
        
        func updateState(isDone: Bool, isDownloaded: Bool) -> PurchaseButtonState {
            if isDone {
                return .open
            }
            return .get(isDownloaded: isDownloaded)
        }
        
        self.state = updateState(isDone: isDone, isDownloaded: isDownloaded)
    }
}
