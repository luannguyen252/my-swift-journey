//
//  ContentView.swift
//  SwiftUI-Projects
//
//  Created by 帝云科技 on 2020/9/9.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(Subviews.allCases, id: \.self) { subview in
                        NavigationLink(destination: subview.view) {
                            ZStack {
                                HStack {
                                    Text(subview.rawValue)
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white)
                                }
                            }
                            .padding()
                            .frame(height: 50)
                        }
                    }
                }
                .listRowBackground(Color.clear)
            }
            .background(Image("bg").edgesIgnoringSafeArea(.all))
            .navigationBarTitle("SwiftUI Projects", displayMode: .inline)
        }
        .accentColor(.red)
        .onAppear(perform: customNavBar)
    }
    
    func customNavBar() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().separatorColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().tableFooterView = UIView()

        let barAppearance = UINavigationBarAppearance()
        barAppearance.shadowColor = nil
        barAppearance.backgroundEffect = nil
        barAppearance.backgroundColor = .clear
        let attributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        barAppearance.titleTextAttributes = attributes
        barAppearance.largeTitleTextAttributes = attributes
        
        let bar = UINavigationBar.appearance()
        bar.standardAppearance = barAppearance
        bar.scrollEdgeAppearance = barAppearance
        bar.compactAppearance = barAppearance
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
