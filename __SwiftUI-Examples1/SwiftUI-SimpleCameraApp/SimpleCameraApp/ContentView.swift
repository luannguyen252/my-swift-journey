//
//  ContentView.swift
//  SimpleCameraApp
//
//  Created by RyoNishimura on 2020/09/05.
//  Copyright © 2020 RyoNishimura. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            CameraAppView(controller: CameraAppController())
            Button(action: {

            }){
                Text("Push")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
