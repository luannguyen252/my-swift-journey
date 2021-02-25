//
//  Asymmetric_Intro.swift
//  SwiftUIAnimations
//
//  Created by Mark Moeykens on 12/18/19.
//  Copyright © 2019 Mark Moeykens. All rights reserved.
//

import SwiftUI
import MapKit

struct Asymmetric_Intro: View {
    @State private var showHelp = false
    
    var body: some View {
        ZStack {
            Color("DarkShade2")
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 20) {
                TitleText("Transitions").foregroundColor(Color("LightShade2"))
                SubtitleText("Asymmetric Introduction").foregroundColor(Color("LightAccent2"))
                BannerText("Provide a different transition for the insertion and removal of a view.", backColor: Color("DarkAccent2"), textColor: Color("LightShade2"))
                
                ZStack(alignment: .topTrailing) {
                    MapView()
                    Button(action: {
                        self.showHelp = true
                    }, label: {
                        Image(systemName: "questionmark.circle.fill")
                    }).padding()
                }.edgesIgnoringSafeArea(.vertical)
            }
            
            // Help View
            if showHelp {
                VStack(spacing: 20) {
                    Text("Help")
                        .foregroundColor(Color("LightShade2"))
                    Image("location")
                    Button("Close") {
                        self.showHelp = false
                    }.padding(.top, 30)
                }
                .padding(35)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color("DarkAccent2")))
                .padding(.top, 100)
                .shadow(radius: 15)
                .transition(AnyTransition.asymmetric(insertion: .slide, removal: .move(edge: .bottom)))
                .animation(.spring())
                .zIndex(1)
            }
        }
        .accentColor(Color("Accent2"))
        .font(.title)
    }
}

struct Asymmetric_Intro_Previews: PreviewProvider {
    static var previews: some View {
        Asymmetric_Intro()
    }
}

struct MapView: UIViewRepresentable {
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
        let coordinate = CLLocationCoordinate2D(
            latitude: 40.7608, longitude: -111.8910)
        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        uiView.setRegion(region, animated: true)
    }
    
    func makeUIView(context: Context) -> MKMapView{
        MKMapView(frame: .zero)
    }
}
