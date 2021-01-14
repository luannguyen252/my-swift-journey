//
//  CustomSearchBar.swift
//  SearchBar
//
//  Created by Hui, Malachi | DCMS on 2020/06/11.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import Foundation
import SwiftUI

struct CustomSearchBar: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: UIViewRepresentableContext<CustomSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<CustomSearchBar>) {
        uiView.text = text
    }
    
    func makeCoordinator() -> CustomSearchBar.Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text:String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
}

