//
//  ContentView.swift
//  SwiftUI10
//
//  Created by Rohit Saini on 13/07/20.
//  Copyright © 2020 AccessDenied. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var text:String = ""
    @State var datas:[String] = ["Hello","Rohit","Saini","Vikas","Ankit","Hunny","Yo yo"]
    var body: some View {
        VStack{
            SearchView(searchTxt: $text)
            List(datas.filter{text == "" ? true : $0.localizedCaseInsensitiveContains(text)},id:\.self){ i in
                Text(i).fontWeight(.heavy)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SearchView:UIViewRepresentable{
    
    @Binding var searchTxt: String
    
    func makeCoordinator() -> SearchView.Coordinator {
        return SearchView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchView>) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.autocapitalizationType = .none
        searchBar.barStyle = .default
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchView>) {
        
    }
    class Coordinator:NSObject,UISearchBarDelegate{
        var parent:SearchView!
        init(parent1:SearchView){
            parent = parent1
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.searchTxt = searchText
        }
    }
}
