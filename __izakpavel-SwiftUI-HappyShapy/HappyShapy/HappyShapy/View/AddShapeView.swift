//
//  AddShapeView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct AddShapeView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    @ObservedObject var newElement: ShapeElement = ShapeElement(kind: .ellipse, name: "")
    let elementsToChoose = AddShapeView.elementToChooseFrom()
    
    static func elementToChooseFrom()->[ShapeElement] {
        return ShapeElementKind.allKinds().map { ShapeElement(kind: $0)}
    }
    
    var body: some View {
        VStack {
            Text("editor.add")
                .font(.title)
                .padding()
            HStack {
                ForEach (self.elementsToChoose) { element in
                    Button (action: {
                        withAnimation {
                            self.newElement.kind = element.kind
                        }
                    }){
                        MultiElementShape(element: element)
                            .fill(element.kind != self.newElement.kind ? Color.secondary : Color("Action"))
                            .frame(width: 44, height: 44)
                            .overlay(
                                Image(systemName: "checkmark")
                                    .foregroundColor(Color.primary.opacity(element.kind != self.newElement.kind ? 0 : 1))
                            )
                    }
                }
            }
            .padding()
            
            if (newElement.kind.requiresCorners()) {
                Group {
                    HStack {
                        Text("add.corners")
                        Spacer()
                    }
                    Slider(value: self.$newElement.corners, in: 3...20)
                }
                .padding()
            }
            
            if (newElement.kind.requiresCornerRadius()) {
                Group {
                    HStack {
                        Text("add.radius")
                        Spacer()
                    }
                    Slider(value: self.$newElement.cornerRadius, in: 0...50)
                }
                .padding()
            }
            
            TextField("add.name", text: self.$newElement.name)
                .padding()
            
            MultiElementShape(element: newElement)
                .fill(Color.secondary)
                .frame(width: 200, height: 200)
                .padding()
            
            HStack {
                Spacer()
                Button(action: {
                    self.viewModel.closeAddDialog()
                }) {
                    Text("button.discard")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("Action")))
                }
                Spacer()
                Button(action: {
                    self.viewModel.shapeComposition.addElement(self.newElement)
                    self.viewModel.closeAddDialog()
                }) {
                    Text("button.confirm")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("Action")))
                }
                Spacer()
            }
            .padding()
        }
        .background(Color("Form"))
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
