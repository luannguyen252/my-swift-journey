//
//  DirectionSearchView.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/17.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI
import MapKit
import Combine // only used at DirectionsEnvironment

struct DirectionsMapView: UIViewRepresentable {
    
    @EnvironmentObject var env: DirectionsEnvironment
    
    typealias UIViewType = MKMapView
    
    let mapView = MKMapView()
    
    func makeCoordinator() -> DirectionsMapView.Coordinator {
        return Coordinator(mapView: mapView)
    }
    
    class Coordinator: NSObject, MKMapViewDelegate {
        
        init(mapView: MKMapView) {
            super.init()
            mapView.delegate = self
        }
        
        func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = .red
            renderer.lineWidth = 5
            return renderer
        }
        
    }
    
    func makeUIView(context: UIViewRepresentableContext<DirectionsMapView>) -> MKMapView {
        mapView
    }
    
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<DirectionsMapView>) {
        
        uiView.removeOverlays(uiView.overlays)
        uiView.removeAnnotations(uiView.annotations)
        
        [env.sourceMapItem, env.destinationMapItem].compactMap{$0}.forEach { (mapItem) in
            let annotation = MKPointAnnotation()
            annotation.title = mapItem.name
            annotation.coordinate = mapItem.placemark.coordinate
            uiView.addAnnotation(annotation)
        }
        uiView.showAnnotations(uiView.annotations, animated: false)
        
        if let route = env.route {
            uiView.addOverlay(route.polyline)
        }
        
    }
}

struct SelectLocationView: View {
    
    @EnvironmentObject var env: DirectionsEnvironment

    @State var mapItems = [MKMapItem]()
    @State var searchQuery = ""
    
    var body: some View {
        VStack {
            
            HStack (spacing: 16) {
                Button(action: {
                    self.env.isSelectingSource = false
                    self.env.isSelectingDestination = false
                    
                }, label: {
                    Image(uiImage: #imageLiteral(resourceName: "annotation_icon"))
                }).foregroundColor(.black)
                
                TextField("Enter search term", text: $searchQuery)
                    .onReceive(NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification).debounce(for: .milliseconds(500), scheduler: RunLoop.main)) { _ in
                    
                        // search
                        let request = MKLocalSearch.Request()
                        request.naturalLanguageQuery = self.searchQuery
                        let search = MKLocalSearch(request: request)
                        search.start { (resp, err) in
                            // check your error
                            self.mapItems = resp?.mapItems ?? []
                        }
                }
            }.padding()
            
            if mapItems.count > 0 {
                ScrollView {
                    ForEach(mapItems, id: \.self) { item in
                        Button(action: {
                            if self.env.isSelectingSource {
                                self.env.isSelectingSource = false
                                self.env.sourceMapItem = item
                            } else {
                                self.env.isSelectingDestination = false
                                self.env.destinationMapItem = item
                            }
                        }) {
                            HStack {
                                VStack (alignment: .leading) {
                                    Text("\(item.name ?? "")")
                                        .font(.headline)
                                    Text("\(item.address())")
                                }
                                Spacer()
                            }
                            .padding()
                        }.foregroundColor(.black)
                        
                    }
                }
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct DirectionsSearchView: View {
    
    @EnvironmentObject var env: DirectionsEnvironment
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .top) {
                
                VStack(spacing: 0) {
                    
                    VStack(spacing: 12) {
                        HStack(spacing: 16) {
                            Image(uiImage: #imageLiteral(resourceName: "annotation_icon")).frame(width: 24)
                            
                            NavigationLink(destination: SelectLocationView(), isActive: $env.isSelectingSource) {
                                
                                HStack {
                                    Text(env.sourceMapItem != nil ? (env.sourceMapItem?.name ?? "") : "Source")
                                    Spacer()
                                }
                                .padding() .background(Color.white).cornerRadius(3)
                            }
                        }
                        
                        HStack(spacing: 16) {
                            Image(uiImage: #imageLiteral(resourceName: "annotation_icon").withRenderingMode(.alwaysTemplate)).foregroundColor(.white)
                                .frame(width: 24)
                            
                            
                            NavigationLink(destination: SelectLocationView(), isActive: $env.isSelectingDestination) {
                                
                                HStack {
                                    Text(env.destinationMapItem != nil ? (env.destinationMapItem?.name ?? "") : "Destination")
                                    Spacer()
                                }
                                .padding() .background(Color.white).cornerRadius(3)
                            }
                        }
                        
                    }
                    .padding()
                    .background(Color.blue)
                    
                    DirectionsMapView().edgesIgnoringSafeArea(.bottom)
                }
                
                // status bar cover
                Spacer().frame(width: UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.frame.width, height: UIApplication.shared.windows.filter{$0.isKeyWindow}.first?.safeAreaInsets.top)
                    .background(Color.blue)
                    .edgesIgnoringSafeArea(.top)
            }
        .navigationBarTitle("DIRECTIONS")
            .navigationBarHidden(true)
        }
    }
}

class DirectionsEnvironment: ObservableObject {
    @Published var isSelectingSource = false
    @Published var isSelectingDestination = false
    
    @Published var sourceMapItem: MKMapItem?
    @Published var destinationMapItem: MKMapItem?
    
    @Published var route: MKRoute?
    
    var cancellable: AnyCancellable?
    
    init() {
        // listen for changes on sourceMapItem, destinationMapitem
        cancellable = Publishers.CombineLatest($sourceMapItem, $destinationMapItem).sink { (items) in
            
            // searching for directions
            let request = MKDirections.Request()
            request.source = items.0
            request.destination = items.1
            let directions = MKDirections(request: request)
            directions.calculate { [weak self] (resp, err) in
                if let err = err {
                    print("Failed to calculate directions:", err)
                    return
                }
                self?.route = resp?.routes.first
            }
        }
    }
}

struct DirectionsSearchView_Previews: PreviewProvider {
    static var env = DirectionsEnvironment()
    
    static var previews: some View {
        DirectionsSearchView().environmentObject(env)
    }
}
