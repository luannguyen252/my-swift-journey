//
//  CustomizingNavigationBar5.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 16/12/2020.
//

import SwiftUI

// MARK: - PEOPLE MODEL
struct People: Identifiable{
    var id = UUID()
    var name = String()
}

struct CustomizingNavigationBar5: View {
    // MARK: - MORE CUSTOM NAVIGATION BAR
    init() {
        // Navigation Bar Background
        UINavigationBar.appearance().backgroundColor = .black
       
        // Navigation Bar Title
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor: UIColor.gray,
            .font: UIFont(name:"TTFirsNeue-Black", size: 40)!
        ]
                
        // Navigation Bar Text
        UINavigationBar.appearance()
            .titleTextAttributes = [
            .font: UIFont(name: "TTFirsNeue-Regular", size: 20)!
        ]
    }
    
    // MARK: - PEOPLE DATA MODEL
    let people: [People] = [
            People(name: "Bill"),
            People(name: "Jacob"),
            People(name: "Olivia")]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(people) { listedPeople in
                NavigationLink(destination: CustomizingNavigationBar5_DetailView(name: listedPeople.name)) {
                    VStack(alignment: .leading){
                        Text(listedPeople.name)
                    }
                }
            }
            .navigationBarItems(leading:
            HStack {
                Button(action: {}) {
                    Image(systemName: "minus.square.fill")
                        .font(.largeTitle)
                }.foregroundColor(.pink)
            }, trailing:
            HStack {
                Button(action: {}) {
                    Image(systemName: "plus.square.fill")
                        .font(.largeTitle)
                }.foregroundColor(.blue)
            })
            .navigationBarTitle(Text("Names"))
        }
    }
}

// MARK: - PREVIEW
struct CustomizingNavigationBar5_Previews: PreviewProvider {
    static var previews: some View {
        CustomizingNavigationBar5()
    }
}
