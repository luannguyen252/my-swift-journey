//
//  ContentView.swift
//  DemoUberSwiftUI
//
//  Created by Bao Vu on 7/13/20.
//  Copyright © 2020 Bao Vu. All rights reserved.
//

import SwiftUI
import MapKit
import CoreLocation


struct ContentView: View {
    var body: some View {
        
        Home()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// This is a main programe....

struct Home : View{
    
    @State var map = MKMapView()
    @State var manager = CLLocationManager()
    @State var alert = false
    @State var source : CLLocationCoordinate2D!
    @State var destination: CLLocationCoordinate2D!
    
    var body: some View{
        
        ZStack{
            
            VStack{
                
                HStack{
                    
                    Text("Pick a Location")
                        .font(.title)
                    Spacer()
                }.padding()
                    .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                    .background(Color.white)
                
                MapView(map: self.$map, manager: self.$manager, alert: self.$alert, source: self.$source, destination: self.$destination)
                    .onAppear{
                        
                        self.manager.requestAlwaysAuthorization()
                        
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: self.$alert) { () -> Alert in
            Alert(title: Text("Error"), message: Text("Please Enable Location In Settings !!!"), dismissButton: .destructive(Text("Ok")))
        }
    }
}

// This is a MapView...

struct MapView: UIViewRepresentable{
    
    func makeCoordinator() -> Coordinator {
        
        return MapView.Coordinator(parent1: self)
        
    }
    
    @Binding var map: MKMapView
    @Binding var manager : CLLocationManager
    @Binding var alert : Bool
    @Binding var source: CLLocationCoordinate2D!
    @Binding var destination: CLLocationCoordinate2D!
    
    func makeUIView(context: Context) -> MKMapView {
        
        map.delegate = context.coordinator
        manager.delegate = context.coordinator
        map.showsUserLocation = true
       
        let gesture = UITapGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.tap(ges:)))
        map.addGestureRecognizer(gesture)
        return map
    }
    
    func updateUIView(_ uiView: MKMapView, context: Context) {
        
    }
    
    
    
    class Coordinator: NSObject,MKMapViewDelegate,CLLocationManagerDelegate{
        
        var parent: MapView
        
        init(parent1: MapView){
            
            parent = parent1
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            
            if status == .denied{
                
                self.parent.alert.toggle()
            }else{
                
                self.parent.manager.startUpdatingLocation()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let region = MKCoordinateRegion(center: locations.last!.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
            self.parent.source = locations.last!.coordinate
            self.parent.map.region = region
        }
        
        @objc func tap(ges: UITapGestureRecognizer){
            
            let location = ges.location(in: self.parent.map)        }
    }
}

