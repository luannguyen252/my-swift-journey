//
//  EditorView.swift
//  HappyShapy
//
//  Created by myf on 13/12/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct ElementCellView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    @ObservedObject var element: ShapeElement
    var textVisible: Bool
    var body: some View {
        
        HStack {
            MultiElementShape(element: element)
                .fill(Color.secondary)
                .frame(width: 44, height: 44)
                .padding()
            if (self.textVisible) {
                Text(element.name)
                    .lineLimit(1)
            }
            Spacer()
            Button(action:{
                withAnimation {
                    self.element.visible.toggle()
                }
            }){
                Image(systemName: element.visible ? "eye.fill" : "eye.slash")
                    .background(Color("Form").opacity(0.00001))
                    .padding()
            }
        }
    }
}

struct ElementListView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    @ObservedObject var shapeComposition: ShapeComposition

    var body: some View {
        List {
            ForEach(self.shapeComposition.elements) { element in
                ElementCellView(element: element, textVisible: self.viewModel.shapeListExpanded)
            }.onDelete(perform: delete)
        }
        .listStyle(GroupedListStyle())
        .listRowBackground(Color("Form"))
        
    }
    
    private func delete(with indexSet: IndexSet) {
        indexSet.forEach { self.shapeComposition.elements.remove(at: $0) }
    }
}


struct EditorView: View {
    @EnvironmentObject var viewModel: EditorViewModel
    
    func shapeCompositionSize(availableSize: CGSize) -> CGSize{
        let minDimension = min(availableSize.width, availableSize.height)
        return CGSize(width: minDimension, height: minDimension)
    }
    
    var body: some View {
        ZStack {
            HStack (alignment: .center){
                VStack{
                    Button (action:{
                        self.viewModel.openAddDialog()
                    }){
                        HStack {
                            Image(systemName: "plus")
                                .font(.title)
                                .padding()
                            if (viewModel.shapeListExpanded) {
                                Text("editor.add")
                                    .padding()
                            }
                        }
                        //.padding()
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color("Action")))
                    }
                    .padding(.top, 40)
                    ElementListView(shapeComposition: self.viewModel.shapeComposition)
                    HStack {
                        Spacer()
                        Button (action:{
                            withAnimation {
                                self.viewModel.toggleListExpansion()
                            }
                        }){
                            Image(systemName: self.viewModel.shapeListExpanded ? "chevron.left" : "chevron.right")
                                .padding()
                        }
                    }
                }
                .background(Color("Form"))
                .frame(width: self.viewModel.listWidth)
                
                GeometryReader { geometry in
                    ShapeCompositionView(size: self.shapeCompositionSize(availableSize: geometry.size))
                }
            }
            .blur(radius: self.viewModel.addDialogOpened ? 20 : 0)
            if (self.viewModel.addDialogOpened) {
                AddShapeView()
                    .frame(width: 400, height: 400)
            }
        }
    }
}
