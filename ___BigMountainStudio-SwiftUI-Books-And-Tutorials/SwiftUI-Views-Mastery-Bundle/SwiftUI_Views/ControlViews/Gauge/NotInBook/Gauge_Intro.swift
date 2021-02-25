//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Gauge_Intro: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Text("Gauge")
                .font(.largeTitle)
            
            Text("Introduction")
                .foregroundColor(.gray)
            
            Text("Gauge gives you a way to show progress in a circular way.")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .foregroundColor(.black)
            
            // Not available in iOS
//            Gauge(value: 2, in: 1...5)
        }
        .font(.title)
    }
}

struct Gauge_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Gauge_Intro()
    }
}
