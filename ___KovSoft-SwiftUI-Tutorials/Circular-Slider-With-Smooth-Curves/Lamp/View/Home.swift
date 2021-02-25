//
//  Home.swift
//  Lamp
//
//  Created by Balaji on 01/12/20.
//

import SwiftUI

struct Home: View {
    // top edge padding..
    var top = UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0
    
    // circle Width...
    var width = UIScreen.main.bounds.width / 2
    
    // rotating angle...
    @State var anlge: Double = 0
    
    @State var on = true
    
    @State var from : Date = Date()
    @State var to : Date = Date()
    
    // for smaller device...
    @State var isSmall = UIScreen.main.bounds.height < 750
    
    var body: some View {
        
        VStack{
            
            ScrollView(isSmall ? .vertical : .init(), showsIndicators: false, content: {
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .top)){
                    
                    Image("lamp")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: isSmall ? 150 : nil, height: isSmall ? 150 : nil)
                    
                    HStack{
                        
                        Button(action: {}, label: {
                            Image(systemName: "chevron.left")
                                .font(.title2)
                                .foregroundColor(.black)
                        })
                        
                        Spacer()
                        
                        Button(action: {}, label: {
                            Image(systemName: "gear")
                                .font(.title2)
                                .foregroundColor(.black)
                        })
                    }
                    .padding()
                    .padding(.top,top)
                    
                }
                .padding(.bottom)
                
                Text("Intensity")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                    .padding()
                
                ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom), content: {
                    
                    ZStack{
                        
                        Circle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: width, height: width)
                        
                        ZStack{
                            
                            Circle()
                                .fill(Color.white)
                                .frame(width: width - 50, height: width - 50)
                                //shadows...
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: 5, y: 5)
                                .shadow(color: Color.black.opacity(0.15), radius: 5, x: -5, y: -5)
                            // also rotating...
                                .rotationEffect(.init(degrees: anlge))
                            
                            Circle()
                                .fill(Color("yellow"))
                                .frame(width: 20, height: 20)
                            // moving view left...
                                .offset(x: (width - 100) / 2)
                                .rotationEffect(.init(degrees: anlge))
                                // adding gesture...
                                .gesture(DragGesture(minimumDistance: 0).onChanged(onChanged(value:)))
                                // 240 - 30 = 210...
                            // rotaing to start point...
                                .rotationEffect(.init(degrees: -210))
                            
                        }
                        
                        // dots....
                        
                        Dots()
                    }
                    
                    HStack{
                        
                        Text("16˚C")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        
                        Text("28˚C")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                    }
                    .padding(.bottom,30)
                })
                .padding()
                .padding(.top)
                
                HStack{
                    
                    Spacer()
                    
                    HStack(spacing: 15){
                        
                        Text("Power Saver")
                            .font(.title)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Toggle("", isOn: $on)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: Color("yellow")))
                    }
                    .padding(.vertical)
                    .padding(.horizontal,20)
                    .background(BlurView().cornerRadius(15))
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 10, content: {
                    Text("Schedule")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                    
                    Text("From")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    HStack(spacing: 15){
                        
                        DatePicker("", selection: $from, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                        // for black color...
                            .accentColor(.black)
                        
                        Text("To")
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        DatePicker("", selection: $to, displayedComponents: [.hourAndMinute])
                            .labelsHidden()
                            .accentColor(.black)
                    }
                })
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom,isSmall ? 15 : 0)
            })
            
            ZStack{
                
                HStack{
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "house")
                            .font(.system(size: 24))
                            .foregroundColor(Color("yellow"))
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    })
                    
                    Spacer()
                    
                    Button(action: {}, label: {
                        
                        Image(systemName: "person")
                            .font(.system(size: 24))
                            .foregroundColor(Color("yellow"))
                            .padding()
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                    })
                }
                
                Button(action: {}, label: {
                    
                    Image(systemName: "plus")
                        .font(.system(size: 24, weight: .heavy))
                        .foregroundColor(Color("yellow"))
                        .padding()
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 5, y: 5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: -5, y: -5)
                })
                // moving view little down...
                .offset(y: 10.0)
            }
            .padding(.horizontal)
            .padding(.top,isSmall ? 0 : 25)
            .padding(.bottom,UIApplication.shared.windows.first?.safeAreaInsets.bottom == 0 ? 15 : 0)
        }
        .ignoresSafeArea(.all, edges: .top)
        .background(
        
            ZStack{
                
                Color("yellow")
                
                Color.white
                    .clipShape(CustomShape())
                // rotating view upside down...
                    .rotationEffect(.init(degrees: 180))
            }
            .ignoresSafeArea(.all, edges: .all)
        )
    }
    
    func onChanged(value: DragGesture.Value){
        
        let translation = value.location
        
        let vector = CGVector(dx: translation.x, dy: translation.y)
        
        // -10 is circle radius since circle size is 20
        // for more info on circular slider
        // check the video link in description !!!
        let radians = atan2(vector.dy - 10, vector.dx - 10)
        
        var angle = radians * 180 / .pi
        
        if angle < 0{angle = 360 + angle}
        
        // limiting angle from 0 to 240...
        if angle <= 240{
            self.anlge = Double(angle)
        }
    }
}
