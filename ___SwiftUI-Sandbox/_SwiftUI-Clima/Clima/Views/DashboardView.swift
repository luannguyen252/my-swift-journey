//
//  ContentView.swift
//  Clima
//
//  Created by mohammad mugish on 25/01/21.
//

import SwiftUI






struct DashboardView: View {
    
    
    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    @StateObject var dashboardViewModel : DashboardViewModel
    
    
  

    var body: some View {
        
        
        VStack{
            if dashboardViewModel.weatherInfo.isEmpty{
                LodingDataView
            }else{
                
                NavigationBarView
                    .padding(.top, horizontalSizeClass == .compact && verticalSizeClass == .regular ? 24 : 8)
                
                
                ScrollView{
                    
                    TempAndImageInformationForSelectedDateView
                    
                    
                    AllWeatherInformationForSelectedDateCardView

                    
                    ListOfWeatherDataCardsInHorizontalView
                   
                }
            }
            
        }
        .onChange(of: scenePhase) { phase in
            switch phase {
            case .active:
                print("Active")
                self.dashboardViewModel.appInForground = true
            case .background:
                print("background")
                self.dashboardViewModel.appInForground = false
            case .inactive:
                print("inactive")
            @unknown default:
                fatalError()
            }
        }
        
        
        
        .background(Color("Background"))
        .edgesIgnoringSafeArea(.all)
    }
    
    var LodingDataView : some View{
        VStack{
            Spacer()
            Text("Loding the data...")
            Spacer()
            HStack{
                Spacer()
            }
            .ignoresSafeArea(.all)
        }
    }
    
    var NavigationBarView : some View {
        ZStack {
            HStack{
                Button(action : {}){
                    NavigationBarButton(imageName: "text.justify")
                }
                Spacer()
                
                Menu {
                    Button(action: {
                        dashboardViewModel.isSelectedTempCentigrade(type: true)
                    }, label: {
                        Label(
                            title: { Text("Centigrade") },
                            icon: { Image(systemName: dashboardViewModel.isTempCentigrade ? "checkmark" : "") }
                        )
                    })
                    
                    Button(action: {
                        dashboardViewModel.isSelectedTempCentigrade(type: false)
                    }, label: {
                        Label(
                            title: { Text("Fahrenheit") },
                            icon: { Image(systemName: dashboardViewModel.isTempCentigrade ? "" : "checkmark")}
                        )
                    })
                    
                } label: {
                    NavigationBarButton(imageName: "gear")
                }
                
                
            }.padding(16)
            
            Text("Bengaluru")
                .font(.system(size: 16, weight: .regular, design: .rounded))
                .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6982621173)))
        }
    }
    
    var TempAndImageInformationForSelectedDateView : some View{
        ZStack(alignment : .trailing) {
            
            HStack {
                VStack(alignment : .leading, spacing : 12) {
                    Text("\(dashboardViewModel.selectedCard.degree)")
                        .font(.system(size: 90, weight: .semibold, design: .default))

                    Text("\(dashboardViewModel.selectedCard.status)")
                }.padding(.leading, 24)
                
                Spacer()
            }
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6006324405))).onAppear{
                print("")
            }
            
            if horizontalSizeClass == .compact && verticalSizeClass == .regular {
                Image(systemName: "\(dashboardViewModel.selectedCard.image)")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: UIScreen.main.bounds.height > 670 ? (UIScreen.main.bounds.height / 2) - 90 : (UIScreen.main.bounds.height / 3) - 70, alignment: .center)
                    .padding(.trailing, dashboardViewModel.selectedCard.status == "Clear" ? -150 :  -100)
            }else{
                
                Image(systemName: "\(dashboardViewModel.selectedCard.image)")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: (UIScreen.main.bounds.height / 2), alignment: .center)
                    .padding(.trailing, dashboardViewModel.selectedCard.status == "Clear" ? -150 :  -100)
                
            }
            
        }
    }
    
    var AllWeatherInformationForSelectedDateCardView : some View{
        ZStack{
            Rectangle()
                .fill(Color("Background"))
                .frame(width: horizontalSizeClass == .compact && verticalSizeClass == .regular ? UIScreen.main.bounds.width - 40 : UIScreen.main.bounds.width, height: 200, alignment: .center)
                .edgesIgnoringSafeArea(.all)
            RoundedRectangle(cornerRadius: 20)
                .fill(Color("Background"))
                .frame(width: horizontalSizeClass == .compact && verticalSizeClass == .regular ? UIScreen.main.bounds.width - 40 : UIScreen.main.bounds.width - 40, height: 200, alignment: .center)
                .shadow(color: Color("LightShadow"), radius: 8, x: -8, y: -8)
                .shadow(color: Color("DarkShadow"), radius: 8, x: 8, y: 8)
            
            VStack(spacing : 32){
                HStack{
                    Image(systemName: "wind")
                    Text("Wind Speed")
                    Spacer()
                    Text("\(dashboardViewModel.selectedCard.windSpeed ) meter/sec")
                }
                
                HStack{
                    Image(systemName: "thermometer")
                    
                    Text("Atmospheric pressure")
                    Spacer()
                    Text("\(dashboardViewModel.selectedCard.atmophericPressure ) Pa")
                }
                HStack{
                    Image(systemName: "aqi.low")
                    Text("Humidity")
                    Spacer()
                    Text("\(dashboardViewModel.selectedCard.humidity ) %")
                }
                
            }
            .foregroundColor(Color.black.opacity(0.6))
            .padding()
            .frame(width: horizontalSizeClass == .compact && verticalSizeClass == .regular ? UIScreen.main.bounds.width - 40 : UIScreen.main.bounds.width - 40, height: 200, alignment: .center)
            
        }
        .padding(.top, 16)
    }
    
    var ListOfWeatherDataCardsInHorizontalView : some View{
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(spacing : 6){
                
                
                ForEach(dashboardViewModel.weatherInfo, id: \.timeStamp){ info in
                    ZStack{
                        
                        Rectangle()
                            .fill(Color("Background"))
                            .frame(width: 120, height: 120, alignment: .center)
                            .edgesIgnoringSafeArea(.all)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color("Background"))
                            .frame(width: 100, height: 120, alignment: .center)
                            .shadow(color: Color(info == dashboardViewModel.selectedCard ? "DarkShadow" : "LightShadow"), radius: 8, x: -8, y: -8)
                            .shadow(color: Color(info == dashboardViewModel.selectedCard ? "LightShadow" : "DarkShadow"), radius: 8, x: 8, y: 8)
                        
                        
                        VStack(alignment : .leading, spacing : 4){
                            Text("\(dashboardViewModel.convertTimestampToDate(timeStamp: info.timeStamp))")
                                .font(.system(size: 12, weight: .regular, design: .default))
                                .foregroundColor(Color.black.opacity(0.5))
                            
                            
                            Text("\(info.degree)")
                                .font(.system(size: 40, weight: .regular, design: .default))
                                .foregroundColor(Color.black.opacity(0.7))
                            
                            HStack{
                                Text("\(info.status)")
                                    .font(.system(size: 12, weight: .regular, design: .default))
                                    .foregroundColor(Color.black.opacity(0.5))
                                Spacer()
                                Image(systemName: "\(info.image)")
                                    .renderingMode(.original)
                                    .font(.system(size: 14, weight: .bold, design: .default))
                                    .shadow(color: info.status != "Clear" ? Color.blue.opacity(0.5)
                                                : Color(#colorLiteral(red: 0.9176470588, green: 0.8745098039, blue: 0.6862745098, alpha: 1)), radius: 6, x: 0.0, y: 3)
                                
                            }
                        }
                        .padding()
                        .frame(width: 100, height: 120, alignment: .leading)
                        
                    }
                    .onAppear{
                        if dashboardViewModel.weatherInfo.first == info{
                            dashboardViewModel.selectedCard = info
                        }
                    }
                    
                    .onTapGesture{
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.3, blendDuration: 0.3)){
                            dashboardViewModel.selectedCard = info
                        }
                        
                    }
                }

            }.padding(.horizontal, 16)
            .padding(.vertical, 24)
        }).padding(.top, 16)
    }
    
}



struct NavigationBarButton : View{
    var imageName : String
    var body: some View{
        
        
        Image(systemName: "\(imageName)")
            .font(.system(size: 14, weight: .semibold, design: .rounded))
            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6966145833)))
            .padding(.horizontal, 10)
            .padding(.vertical, 10)
            .background(ZStack {
                Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .foregroundColor(.white)
                    .blur(radius: 4)
                    .offset(x: -5, y: -5)
                
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(
                        LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9019607843, green: 0.9294117647, blue: 0.9882352941, alpha: 1)), Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                    )
                    .padding(2)
                    .blur(radius: 2)
            })
            .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            .shadow(color: Color("DarkShadow"), radius: 20, x: 20, y: 20)
            .shadow(color: Color("LightShadow"), radius: 20, x: -20, y: -20)
        
    }
}



