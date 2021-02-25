//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct LazyVStack_Table: View {
    @State private var data = Data.getProfiles()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    Section() {
                        ForEach(data) { datum in
                            ZStack {
                                NavigationLink(destination: Text("destination")) {
                                    HStack {
                                        Image(datum.imageName)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(Circle())
                                        Text(datum.name)
                                        Spacer()
                                    }
                                    .padding(.horizontal)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            }
        }
    }
}

struct LazyVStack_Table_Previews: PreviewProvider {
    static var previews: some View {
        LazyVStack_Table()
    }
}
