//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MatchedGeometryEffect_FromList2: View {
    @Namespace private var profileTransition
    
    @State private var profiles = Data.getProfiles()
    @State var showProfileDetail = false
    @State var selectedProfile: Data.Profile!
    
    var body: some View {
        VStack {
            if showProfileDetail {
                VStack {
                    Text(selectedProfile.name)
                        .fontWeight(.heavy)
                        .font(.largeTitle)
                        .matchedGeometryEffect(id: selectedProfile.name, in: profileTransition, properties: .position)
                    Image(selectedProfile.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        //.frame(width: 160.0, height: 160.0) // Animation fails
                        .matchedGeometryEffect(id: selectedProfile.imageName, in: profileTransition, isSource: true)
                    
                    Spacer()
                    
                    Button(action: {
                        showProfileDetail = false
                    }) {
                        Text("Close")
                            .padding()
                            .background(Capsule().stroke(Color.blue, lineWidth: 2))
                    }
                    .transition(.move(edge: .top))
                    .animation(.easeIn)
                }
            } else {
//                let profile = profiles[0]
                List(profiles) { profile in
                    HStack {
                        Image(profile.imageName)
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 60.0, height: 60.0)
                            .matchedGeometryEffect(id: profile.imageName, in: profileTransition)
                        Text(profile.name)
                            .fontWeight(.heavy)
                            .font(.largeTitle)
                            .matchedGeometryEffect(id: profile.name, in: profileTransition, properties: .position, isSource: true)
                    }
                    .onTapGesture {
                        withAnimation {
                            showProfileDetail.toggle()
                            selectedProfile = profile
                        }
                    }
                }
            }
        }
//        .onTapGesture {
//            withAnimation {
//                showProfileDetail.toggle()
//            }
//        }
        .onAppear {
            selectedProfile = profiles[0]
        }
    }
}

struct MatchedGeometryEffect_FromList2_Previews: PreviewProvider {
    static var previews: some View {
        MatchedGeometryEffect_FromList2()
    }
}
