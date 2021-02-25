//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_AddParkNameToRow: View {
    @Namespace var namespace
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(parks) { park in
                    ZStack(alignment: .bottom) {
                        Image(park.imageName)
                            .resizable()
                            .scaledToFill()
                            .cornerRadius(30)
                        
                        Text(park.name)
                            .font(.title)
                            .fontWeight(.heavy)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color(UIColor.systemBackground).opacity(0.4))
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}


struct MGE_AddParkNameToRow_Previews: PreviewProvider {
    static var previews: some View {
        MGE_AddParkNameToRow()
    }
}
