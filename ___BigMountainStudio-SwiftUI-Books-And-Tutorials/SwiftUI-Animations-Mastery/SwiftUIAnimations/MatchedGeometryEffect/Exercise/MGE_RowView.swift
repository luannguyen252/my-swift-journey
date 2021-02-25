//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_RowView: View {
    @Namespace var namespace
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(parks) { park in
                    ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                }
            }
        }
        .ignoresSafeArea(edges: .top)
    }
}

struct ParksRowView: View {
    var namespace: Namespace.ID
    @Binding var selectedPark: Item?
    var park: Item
    
    var body: some View {
        VStack {
            if park.id != selectedPark?.id {
                ZStack(alignment: .bottom) {
                    Image(park.imageName)
                        .resizable()
                        .scaledToFill()
                        .cornerRadius(30)
                        .matchedGeometryEffect(id: park.id, in: namespace)
                    
                    Text(park.name)
                        .font(.title)
                        .fontWeight(.heavy)
                        .matchedGeometryEffect(id: "\(park.id)name", in: namespace, properties: .position)
                        .zIndex(1) // Keep park name above image
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color(UIColor.systemBackground).opacity(0.4))
                }
            } else {
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .hidden()
            }
        }
        .padding(.horizontal, 12)
        .onTapGesture { selectedPark = park }
    }
}

struct MGE_RowView_Previews: PreviewProvider {
    static var previews: some View {
        MGE_RowView()
    }
}
