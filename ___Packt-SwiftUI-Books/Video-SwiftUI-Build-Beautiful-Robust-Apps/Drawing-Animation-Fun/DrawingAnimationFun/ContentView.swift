//
//  ContentView.swift
//  DrawingAnimationFun
//
//  Created by zappycode on 6/21/19.
//  Copyright © 2019 Nick Walter. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State var showZappyCode = true
    
    var body: some View {
        VStack {

            if showZappyCode { ZappyCodeView().padding().transition(.slide)
            }
            
            Button(action: {
                withAnimation {
                    self.showZappyCode.toggle()
                }
            }) {
                Text("Toggle")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
