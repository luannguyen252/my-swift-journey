//
//  ContentView.swift
//  Weather
//
//  Created by Stephen DeStefano on 8/29/19.
//  Copyright © 2019 Stephen DeStefano. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ViewModel
    @State var isAnimate = false
    @State var viewState = CGSize.zero
    
    init() {
        self.viewModel = ViewModel()
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 30) {
        
        Spacer()
            Text("Weather")
            .font(.custom("Noteworthy-Bold", size: 40))
            .padding(EdgeInsets(top: 10, leading: 120, bottom: 0, trailing: 120))
            
            //textField
            HStack(alignment: .center, spacing: 20) {
                TextField("enter a city to look up", text: self.$viewModel.cityName) {
                    self.viewModel.cityLookup()
                    self.isAnimate.toggle()
                    
                }.padding(10)
                .shadow(color: .blue, radius: 10)
                .cornerRadius(10)
                .fixedSize()
                .font(.custom("Ariel", size: 26))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("background"))
                .cornerRadius(15)
              }
            //temperature
            HStack(alignment: .center) {
                image(image: "temp", background: "background")
                    .rotation3DEffect(Angle(degrees: isAnimate ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8))
                .onTapGesture {
                self.isAnimate.toggle()
                }
                .offset(x: viewState.width, y: viewState.height)
                .gesture(DragGesture()
                .onChanged { value in
                    self.viewState = value.translation
                    self.isAnimate = true
                    }
                .onEnded { value in
                    self.viewState = .zero
                    self.isAnimate = false
                    })
                    //.scaleEffect(isAnimate ? 1.9 : 1.0)
                
                descriptionText(title: "Temperature")
                
                Text(self.viewModel.temperature)
                    .modifier(dataText()).rotation3DEffect(Angle(degrees: isAnimate ? 360 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                    .animation(.easeInOut(duration: 0.8))
                
                Spacer()
                
              }
            
            //humidity
                       HStack(alignment: .center) {
                           image(image: "humidity", background: "background10")
                        .rotation3DEffect(Angle(degrees: isAnimate ? 720 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                        descriptionText(title: "Humidity")
                           
                           Text(self.viewModel.humid)
                           .modifier(dataText())
                        .rotation3DEffect(Angle(degrees: isAnimate ? 720 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                           Spacer()
                           
                        }
            
               //pressure
                          HStack(alignment: .center) {
                              image(image: "pressure", background: "background3")
                            .rotation3DEffect(Angle(degrees: isAnimate ? 1080 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                            .animation(.easeInOut(duration: 0.8))
                            
                            descriptionText(title: "Pressure")
                              
                              Text(self.viewModel.press)
                               .modifier(dataText())
                            .rotation3DEffect(Angle(degrees: isAnimate ? 1080 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                            .animation(.easeInOut(duration: 0.8))
                            
                              Spacer()
                              
                            }
            
            //wind speed
                       HStack(alignment: .center) {
                           image(image: "windSpeed", background: "background4")
                        .rotation3DEffect(Angle(degrees: isAnimate ? 1440 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                        descriptionText(title: "Wind Speed")
                           
                           Text(self.viewModel.windSpeed)
                            .modifier(dataText())
                        .rotation3DEffect(Angle(degrees: isAnimate ? 1440 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                           Spacer()
                           
                         }
            
            //wind direction
                       HStack(alignment: .center) {
                           image(image: "windDirection", background: "background5")
                        .rotation3DEffect(Angle(degrees: isAnimate ? 1800 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                        descriptionText(title: "Wind Direction")
                           
                           Text(self.viewModel.windDirection)
                           .modifier(dataText())
                        .rotation3DEffect(Angle(degrees: isAnimate ? 1800 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                               
                               
                           Spacer()
                           
                         }
            
            //cloud percentage
                       HStack(alignment: .center) {
                           image(image: "cloud", background: "background2")
                        .rotation3DEffect(Angle(degrees: isAnimate ? 2160 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                        descriptionText(title: "Cloud Percent")
                           
                           Text(self.viewModel.cloudPercent)
                               .modifier(dataText())
                        .rotation3DEffect(Angle(degrees: isAnimate ? 2160 : 0), axis: (x: 10, y: 0.0, z: 0.0))
                        .animation(.easeInOut(duration: 0.8))
                        
                           Spacer()
                           
                         }
            Spacer()
        }.background(Image("screenBackground")
            .resizable().scaledToFill().edgesIgnoringSafeArea(.all))
        }
    }








#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
#endif

struct image: View {
    var image = ""
    var background = ""
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 80)
            .background(Color(background))
            .cornerRadius(20)
            .shadow(radius: 15)
            .padding(.leading, 40)
            .padding(.bottom, 0)
    }
}

struct descriptionText: View {
    var title = ""
    var body: some View {
        Text(title)
            .font(.system(size: 23))
            .shadow(color: .black, radius: 0.5, x: 0, y: 1)
            .frame(width: 150, height: 20, alignment: .center)
    }
}

struct dataText: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .shadow(color: .black, radius: 0.5, x: 0, y: 1)
        
    }
    
}
