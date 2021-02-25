//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MatchedGeometryEffect_FromList: View {
    @State private var profiles = Data.getProfiles()
    @State var showProfileDetail = false
    @State var selectedProfile: Data.Profile!
    
    @Namespace private var profileTransition
    
    var body: some View {
        VStack {
            if showProfileDetail {
//                Text(selectedProfile.name)
//                    .font(.largeTitle)
//                    .fontWeight(.heavy)
//                    .matchedGeometryEffect(id: 2, in: profileTransition, properties: .position)
                Image(selectedProfile.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "test", in: profileTransition)
//                Spacer()
//                Button(action: {
//                    showProfileDetail = false
//                }) {
//                    Text("Close")
//                        .padding()
//                        .background(Capsule().stroke(Color.blue, lineWidth: 2))
//                }
            } else {
                let profile = profiles[0]
                
                Image(profile.imageName)
                    .resizable()
                    .frame(width: 60.0, height: 60.0)
                    .matchedGeometryEffect(id: "test", in: profileTransition)
                    .onTapGesture {
                        withAnimation {
                            selectedProfile = profile
                            showProfileDetail = true
                        }
                    }
                
                // Not working
//                Button(action: {
//                    selectedProfile = profile
//                    showProfileDetail = true
//                }, label: {
//                    HStack {
//                        Image(profile.imageName)
//                            .resizable()
//                            .renderingMode(.original)
//                            .frame(width: 60.0, height: 60.0)
//                            .matchedGeometryEffect(id: 1, in: profileTransition)
//                        Text(profile.name)
//                            .font(.title)
//                            .matchedGeometryEffect(id: 2, in: profileTransition)
//                        Spacer()
//                    }
//                })
                
                // Not working
                //                    List(profiles) { profile in
                //                        Button(action: {
                //                            selectedProfile = profile
                //                            showProfileDetail = true
                //                        }, label: {
                //                            HStack {
                //                                Image(profile.imageName)
                //                                    .resizable()
                //                                    .renderingMode(.original)
                //                                    .frame(width: 60.0, height: 60.0)
                //                                    .matchedGeometryEffect(id: profile.imageName, in: profileTransition)
                //                                Text(profile.name)
                //                                    .font(.title)
                //                                    .matchedGeometryEffect(id: profile.name, in: profileTransition)
                //                                Spacer()
                //                            }
                //                        })
                //                    }
            }
        }
        .animation(.default)
    }
}

struct MatchedGeometryEffect_FromList_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MatchedGeometryEffect_FromList()
                .previewLayout(.sizeThatFits)
            MatchedGeometryEffect_FromList(showProfileDetail: true,
                                           selectedProfile: Data.Profile(name: "Ahmere Budniewski", imageName: "profile1"))
                .previewLayout(.sizeThatFits)
        }
    }
}
