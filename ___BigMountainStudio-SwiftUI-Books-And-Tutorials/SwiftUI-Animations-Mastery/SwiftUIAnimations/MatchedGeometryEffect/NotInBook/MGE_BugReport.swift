//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio
// Resolved in the final release of SwiftUI 2.

import SwiftUI

struct MGE_BugReport: View {
    @State private var showDetail = false
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text("MatchedGeometryEffect").font(.title)
            Text("The image becomes faded when using a matchedGeometryEffect on it.")
            
            Spacer()
            
            if showDetail == false {
                HStack {
                    Image("profile.female")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50)
                        .cornerRadius(8)
                        .overlay(RoundedRectangle(cornerRadius: 8)
                                    .strokeBorder(Color.green, lineWidth: 2))
                        .matchedGeometryEffect(id: "customerProfile", in: namespace)
                    
                    Text("Customer Profile")
                        .matchedGeometryEffect(id: "customerProfileText", in: namespace)
                }
                .onTapGesture {
                    showDetail.toggle()
                }
            }
            
            if showDetail {
                Text("Customer Profile")
                    .font(.largeTitle)
                
                Image("profile.female")
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(16)
                    .overlay(RoundedRectangle(cornerRadius: 16)
                                .strokeBorder(Color.green, lineWidth: 2))
                    .matchedGeometryEffect(id: "customerProfile", in: namespace)
                Button("Close", action: { showDetail.toggle() })
            }
            
            Spacer()
        }
        .animation(.linear)
        .padding(.bottom)
    }
}

struct MGE_BugReport_Previews: PreviewProvider {
    static var previews: some View {
        MGE_BugReport()
    }
}
