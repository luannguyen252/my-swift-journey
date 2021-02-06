//
//  EditorViewModel.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import Foundation
import SwiftUI

class EditorViewModel : ObservableObject{
    @Published var addDialogOpened: Bool = false
    @Published var shapeListExpanded: Bool = true
    @Published var listWidth: CGFloat = EditorViewModel.mainListWidth
    @Published var shapeComposition: ShapeComposition = ShapeComposition.debugComposition() // TODO change
    
    // handling transformations
    @Published var activeElement: ShapeElement? = nil
    var originalElementPosition: CGPoint? = nil
    var originalElementRotation: Double? = 0
    var originalElementScale: CGSize? = nil
    
    private static let mainListWidth:CGFloat  = 360
    private static let mainListCollapsedWidth:CGFloat = 180
    
    func toggleListExpansion() {
        if self.shapeListExpanded {
            self.shapeListExpanded = false
            self.listWidth = EditorViewModel.mainListCollapsedWidth
        }
        else {
            self.shapeListExpanded = true
            self.listWidth = EditorViewModel.mainListWidth
        }
    }
    
    func openAddDialog() {
        withAnimation {
            self.addDialogOpened = true
        }
    }
    
    func closeAddDialog() {
        withAnimation {
            self.addDialogOpened = false
        }
    }
}
