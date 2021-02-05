//
//  SearchBarView.swift
//  Meals3
//
//  Created by Uwe Petersen on 09.11.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import SwiftUI


struct SearchBarView: View {
    
    @Binding var searchText: String
    @State private var showCancelButton: Bool = false
//    var onCommit: () ->Void = {print("onCommit")}
    var onCommit: () ->Void = {}

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                
                // Search text field
                ZStack (alignment: .leading) {
                    if searchText.isEmpty { // Separate text for placeholder to give it the proper color
                        Text("Search")
                    }
                    TextField("", text: $searchText, onEditingChanged: { isEditing in
                        self.showCancelButton = true
//                        print("Isediting: \(isEditing)")
                    }, onCommit: onCommit).foregroundColor(.primary)
                }
                // Clear button
                Button(action: {
                    self.searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                }
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary) // For magnifying glass and placeholder test
            .background(Color(.tertiarySystemFill))
            .cornerRadius(10.0)
            
            if showCancelButton  {
                // Cancel button
                Button("Cancel") {
                    UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                    self.searchText = ""
                    self.showCancelButton = false
                }
                .foregroundColor(Color(.systemBlue))
            }
        }
        .padding(.horizontal)
//        .navigationBarHidden(showCancelButton)
    }
}


struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""))
    }
}


//// MARK: - For resgning keyboard on drag gesture

extension UIApplication {
    func endEditing(_ force: Bool) {
        windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

//struct ResignKeyboardOnDragGesture: ViewModifier {
//    var gesture = DragGesture()
//        .onChanged{_ in
//            UIApplication.shared.endEditing(true)
//    }
////    .onChanged() { _ in
////        print("dragging and resigning searchbar")
////    }
//    func body(content: Content) -> some View {
////        content.gesture(gesture)
//        content.simultaneousGesture(gesture)
//    }
//}
//
//extension View {
//    func resignKeyboardOnDragGesture() -> some View {
//        modifier(ResignKeyboardOnDragGesture())
//    }
//}
