//
//  IndicatorView.swift
//  People
//
//  Created by App Designer2 on 17.07.20.
//

import SwiftUI

struct IndicatorView: View {
    
    @EnvironmentObject var isLoged : Login
    
    var body: some View {
        VStack {
            if self.isLoged.isLoged == true {
                ContentView()
            } else {
                //LogingView()
            }
        } .onAppear {
            //self.indicator.isAnonymous.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 35) {
                self.isLoged.isLoged = false
            }
        }
     }
}



struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        IndicatorView().environmentObject(Login())
    }
}
