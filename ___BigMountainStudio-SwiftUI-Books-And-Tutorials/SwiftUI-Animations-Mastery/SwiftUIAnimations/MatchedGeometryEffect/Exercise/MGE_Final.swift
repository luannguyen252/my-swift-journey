//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MGE_Final: View {
    @Namespace var namespace
    @State var selectedPark: Item?
    @State var parks = Data.getUtahNationalParks()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12, pinnedViews: .sectionHeaders) {
                Section(header: MGE_HeaderView()) {
                    ForEach(parks) { park in
                        MGE_ParksRowView(namespace: namespace, selectedPark: $selectedPark, park: park)
                            .animation(.easeOut)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .overlay(Group {
            if let park = selectedPark {
                MGE_ParkDetailView(namespace: namespace, selectedPark: $selectedPark, park: park)
                    .animation(.easeOut)
            }
        })
    }
}

struct MGE_HeaderView: View {
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(UIColor.systemBackground)
                .opacity(0.8)
            
            Text("UTAH  NATIONAL  PARKS")
                .font(.title)
                .fontWeight(.black)
                .padding()
                .frame(maxWidth: .infinity)
        }
        .frame(height: 100)
    }
}

struct MGE_ParksRowView: View {
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
                        .zIndex(1)
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
        .onTapGesture {
            selectedPark = park
        }
    }
}

struct MGE_ParkDetailView: View {
    var namespace: Namespace.ID
    @Binding var selectedPark: Item!
    var park: Item!
    @State private var show = false
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            GeometryReader { gp in
                Image(park.imageName)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.4)
                    .blur(radius: 30)
                    .ignoresSafeArea()
            }
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    HStack {
                        Text(park.name)
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.horizontal)
                            .matchedGeometryEffect(id: "\(park.id)name", in: namespace, properties: .position)
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: park.isFavorite ? "bookmark.fill" : "bookmark")
                                .foregroundColor(.white)
                                .padding(12)
                                .background(Circle())
                        })
                        .shadow(radius: 10, y: 15)
                        .offset(x: show ? 0 : 60)
                        .animation(Animation.easeOut.delay(0.4))
                    }
                    .zIndex(1) // Keep park name above image
                    .padding(.trailing)
                    
                    Image(park.imageName)
                        .resizable()
                        .scaledToFill()
                        .matchedGeometryEffect(id: park.id, in: namespace)
                    
                    Group {
                        HStack {
                            Text(park.location)
                                .font(.title3)
                                .italic()
                                .bold()
                                .opacity(0.5)
                            
                            Spacer()
                            
                            Button(action: {}, label: {
                                Image(systemName: "map")
                                    .foregroundColor(.white)
                                    .padding(12)
                                    .background(Circle())
                            })
                            .shadow(radius: 10, y: 15)
                        }
                        
                        Text(park.details)
                            .padding(.bottom)
                        
                        Button(action: { selectedPark = nil }, label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .font(.title)
                                .padding()
                                .background(Circle())
                        })
                        .shadow(radius: 10, y: 15)
                        .frame(maxWidth: .infinity)
                    }
                    .padding(.horizontal)
                    .offset(y: show ? 0 : 20)
                    .opacity(show ? 1 : 0)
                    .animation(Animation.easeOut.delay(0.4))
                }
            }
        }
        .onAppear {
            show.toggle()
        }
        .accentColor(Color("Gold"))
    }
}

struct MGE_Final_Previews: PreviewProvider {
    @Namespace static var ns
    @State static var selectedPark: Item? = Item(name: "Zion", imageName: "Zion", details: "Zion National Park is a southwest Utah nature preserve distinguished by Zion Canyon’s steep red cliffs. Zion Canyon Scenic Drive cuts through its main section, leading to forest trails along the Virgin River. The river flows to the Emerald Pools, which have waterfalls and a hanging garden. Also along the river, partly through deep chasms, is Zion Narrows wading hike.", location: "Springdale, UT")
    @State static var parks = [selectedPark!]
    
    static var previews: some View {
        Group {
            //            MGE_HeaderView()
            //                .previewLayout(.sizeThatFits)
            
            MGE_Final()
                .preferredColorScheme(.dark)
            
            MGE_ParkDetailView(namespace: ns, selectedPark: $selectedPark, park: selectedPark)
                .preferredColorScheme(.dark)
        }
    }
}
