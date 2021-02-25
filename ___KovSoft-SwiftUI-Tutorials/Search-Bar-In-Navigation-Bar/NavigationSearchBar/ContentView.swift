//
//  ContentView.swift
//  NavigationSearchBar
//
//  Created by Balaji on 29/11/20.
//

import SwiftUI

struct ContentView: View {
    @State var filteredItems = apps
    
    var body: some View {

        CustomNavigationView(view: AnyView(Home(filteredItems: $filteredItems)), placeHolder: "Apps,Games", largeTitle: true, title: "Kavsoft",
                             
            onSearch: { (txt) in

            // filterting Data...
            if txt != ""{
                self.filteredItems = apps.filter{$0.name.lowercased().contains(txt.lowercased())}
            }
            else{
                self.filteredItems = apps
            }
            
        }, onCancel: {
            // Do Your Own Code When Search And Canceled....
            self.filteredItems = apps
            
        })
        .ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Custom Navigation View.....
