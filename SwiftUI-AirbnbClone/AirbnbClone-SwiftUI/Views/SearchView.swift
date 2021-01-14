//
//  SearchView.swift
//  SwiftUI-List
//
//  Created by Keerthi on 07/08/20.
//  Copyright © 2020 Hxtreme. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    @State var search = ""
    @State private var isEditing = false

    var body: some View {
        HStack {
            HStack() {
                Image(systemName: "magnifyingglass")
                .foregroundColor(Color(UIColor.lightGray))
                TextField("Search your destination", text: $search)
                    .foregroundColor(Color(UIColor.black))
                    .onTapGesture {
                        self.isEditing = true
                }
                
                if isEditing {
                    Button(action: {
                        self.search = ""
                    }){
                        Image(systemName: "multiply.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 8)
                    }
                }
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(5)
            
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.search = ""
                    
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }){
                    Text("Cancel")
                }
                .transition(.move(edge: .trailing))
                .animation(.easeIn)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
