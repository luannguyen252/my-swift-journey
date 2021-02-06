//
//  ShapeCompositionView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

enum ShapeTransformation {
    case none
    case position
    case scale
    case rotation
}

struct ShapeCompositionView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    @State var needsRedraw: Bool = false
    @State var transformation: ShapeTransformation = .none
    
    
    var size: CGSize
    
    func elementPosition(_ element: ShapeElement) -> CGPoint{
        return CGPoint(x: element.position.x*size.width, y: element.position.y*size.height)
    }
    
    func elementWidth(_ element: ShapeElement) -> CGFloat{
        return element.size.width*size.width
    }
    
    func elementHeight(_ element: ShapeElement) -> CGFloat{
        return element.size.height*size.height
    }
    
    func transformerSize() -> CGSize{
        if let activeElement = self.viewModel.activeElement {
            let width = self.elementWidth(activeElement)
            let height = self.elementHeight(activeElement)
            return CGSize(width: width, height:height)
        }
        return CGSize()
    }
    
    func transformerPosition() -> CGPoint{
        if let activeElement = self.viewModel.activeElement {
            return self.elementPosition(activeElement)
        }
        return CGPoint()
    }
    
    func positionChangeFromDragOffset(offset: CGSize) -> CGSize{
        let xChange = offset.width/size.width
        let yChange = offset.height/size.height
        return CGSize(width: xChange, height: yChange)
    }
    
    func scaleChangeFromDragOffset(offset: CGSize) -> CGSize{
        let xChange = offset.width/size.width
        let yChange = offset.height/size.height
        return CGSize(width: 2*xChange, height: 2*yChange)
    }
    
    func startTransformation(startPosition: CGPoint, elementSize: CGSize, elementPosition: CGPoint) -> ShapeTransformation {
        let touchPoint:CGFloat = 40
        
        let localCoordinate = CGPoint(x: startPosition.x - elementPosition.x + elementSize.width/2, y: startPosition.y - elementPosition.y + elementSize.height/2)
        
        if (localCoordinate.x<touchPoint && localCoordinate.y<touchPoint) { // top left
            return .rotation
        }
        else if (localCoordinate.x>elementSize.width-touchPoint && localCoordinate.y>elementSize.height-touchPoint) { // scale
            return .scale
        }
        else {
            return .position
        }
    }
    
    
    var body: some View {
        ZStack {
            ForEach (self.viewModel.shapeComposition.elements) { element in
                ShapeElementView(element: element)
                    .frame(width: self.elementWidth(element), height: self.elementHeight(element))
                    .rotationEffect(Angle(degrees: element.rotation))
                    .position(self.elementPosition(element))
                    .onTapGesture {
                        self.viewModel.activeElement = element
                    }
                .opacity(self.needsRedraw ? 1.0 : 1.0)
                    // TODO decide if we will use degrees or radians .rotationEffect(Angle())
            }
            TransformerView(size: self.transformerSize())
                //.rotationEffect(Angle(degrees: self.viewModel.activeElement?.rotation ?? 0))
                .position(self.transformerPosition())
                .opacity(self.viewModel.activeElement != nil ? 1 : 0)
                .simultaneousGesture( DragGesture(minimumDistance: 1, coordinateSpace: .local) // can be changed to simultaneous gesture to work with buttons
                    .onChanged { value in
                        
                        switch self.transformation {
                            case .none:
                                // decide transformation
                                self.transformation = self.startTransformation(startPosition: value.startLocation, elementSize: self.transformerSize(), elementPosition: self.transformerPosition())
                            case .position:
                                let dragOffset = value.translation
                                let elementOffset = self.positionChangeFromDragOffset(offset: dragOffset)
                                if let originalPosition = self.viewModel.originalElementPosition {
                                    self.viewModel.activeElement?.position = CGPoint(x: originalPosition.x + elementOffset.width, y: originalPosition.y + elementOffset.height)
                                    self.needsRedraw.toggle() // handling updates
                                }
                                else {
                                    self.viewModel.originalElementPosition = self.viewModel.activeElement?.position
                                }
                            case .rotation:
                                let dragOffset = value.translation
                                if let originalRotation = self.viewModel.originalElementRotation {
                                    self.viewModel.activeElement?.rotation = originalRotation+Double(dragOffset.width + dragOffset.height)
                                    self.needsRedraw.toggle()
                                }
                                else {
                                    self.viewModel.originalElementRotation = self.viewModel.activeElement?.rotation
                                }
                            
                            case .scale:
                                let dragOffset = value.translation
                                let elementSizeOffset = self.scaleChangeFromDragOffset(offset: dragOffset)
                                if let originalScale = self.viewModel.originalElementScale {
                                    self.viewModel.activeElement?.size = CGSize(width: originalScale.width + elementSizeOffset.width, height: originalScale.height + elementSizeOffset.height)
                                    self.needsRedraw.toggle() // handling updates
                                }
                                else {
                                    self.viewModel.originalElementScale = self.viewModel.activeElement?.size
                                }
                        }
                        
                    }
                    .onEnded { value in
                        self.viewModel.originalElementPosition = nil
                        self.viewModel.originalElementScale = nil
                        self.viewModel.originalElementRotation = nil
                        self.transformation = .none
                    }
                )
        }
        .background(Color("Canvas"))
        .frame(width: size.width, height: size.height)
    }
}

