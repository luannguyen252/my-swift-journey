//
//  ContentView.swift
//  SwiftUIApp
//
//  Created by 帝云科技 on 2020/10/30.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) private var scenePhase
    
    @State private var presented: Bool = false
    
    var body: some View {
        
        Text("Hello, world!")
            .padding()
            .onChange(of: scenePhase, perform: { value in
                if value == .active {
                    print("Application view is active...")
                }
            })
            .onOpenURL(perform: { url in
                print("View Received URL:\(url)")
            })
            .onTapGesture() {
                self.presented.toggle()
            }
            .sheet(isPresented: $presented, content: {
                ColorView()
            })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
