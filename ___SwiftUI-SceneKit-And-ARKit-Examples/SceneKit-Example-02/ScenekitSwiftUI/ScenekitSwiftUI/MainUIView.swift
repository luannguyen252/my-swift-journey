//
//  MainUIView.swift
//  ScenekitSwiftUI
//
//  Created by Shreyas Vilaschandra Bhike on 14/11/20.
//

import SwiftUI
import SceneKit

struct Model : Identifiable {
    
    var id : Int
    var name : String
    var modelName : String
    var details : String
}
struct MainUIView: View {
      @State private var showInfo = false
      @State var models = [
        
          Model(id: 0, name: "Astronaut", modelName: "Astronaut.usdz", details: "An astronaut is a person trained by a human spaceflight program to command, pilot, or serve as a crew member of a spacecraft. Members of the space program of Russia or the Soviet Union are referred to as cosmonauts."),
          
          Model(id: 0, name: "Comet", modelName: "Comet.usdz", details: "A comet is an icy, small Solar System body that, when passing close to the Sun, warms and begins to release gases, a process called outgassing. This produces a visible atmosphere or coma, and sometimes also a tail."),
          
          Model(id: 0, name: "SpaceShuttle", modelName: "SpaceShuttle.usdz", details: "A spacecraft is a vehicle or machine designed to fly in outer space. A type of artificial satellite, spacecraft are used for a variety of purposes, including communications, Earth observation, meteorology, navigation, space colonization, planetary exploration, and transportation of humans and cargo."),
      ]
  
      @State var index = 0
  
      var body: some View{
        ZStack{
            Color.clear.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            
          VStack{
            Text("SceneKit With SwiftUI")
                .font(.title3)
                .fontWeight(.regular)
                .foregroundColor(Color.black)
            
            
            
          SceneView(
            scene: SCNScene(named: models[index].modelName),
           options:[.autoenablesDefaultLighting,.allowsCameraControl]
             )
         
            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height / 2)
           
              
              ZStack{
                  HStack{
                      Button(action: {
                          withAnimation{
                              if index > 0{
                                  index -= 1
                              }
                          }
                          
                      }, label: {
                          Image(systemName: "chevron.left")
                              .font(.system(size: 35, weight: .bold))
                              .opacity(index == 0 ? 0.3 : 1)
                      })
                      .disabled(index == 0 ? true : false)
                      Spacer(minLength: 0)
                      
                    Button(action: {
                          withAnimation{
                              if index < models.count{
                                  index += 1
                              }
                          }
                          
                      }, label: {
                          
                          Image(systemName: "chevron.right")
                              .font(.system(size: 35, weight: .bold))
                          // disabling button when no other data ....
                              .opacity(index == models.count - 1 ? 0.3 : 1)
                      })
                      .disabled(index == models.count - 1 ? true : false)
                  }
                  
                  Text(models[index].name)
                       
                    .font(.largeTitle)
              }
              .foregroundColor(.black)
              .padding(.horizontal)
              .padding(.vertical,30)
              
              VStack(alignment: .leading, spacing: 15, content: {
                  
                ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 10, x: 0.0, y: 0.0)
                    .opacity(0.3)
                    
                    
                    
                    
                VStack(alignment: .leading, spacing: 12, content:{
                  Text(" About : ")
                      .font(.title2)
                      .fontWeight(.bold)
                  
                    Text(models[index].details)
                        .multilineTextAlignment(.leading)
                        .frame(width: 350, height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    
                    HStack{
                    Spacer()
                        .frame(width: 280, height: 0, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    Button(action: {
                        self.showInfo.toggle()
                    }, label: {Text("More Info")})
                    }.sheet(isPresented: self.$showInfo) {
                        ShowInfo()
                    }
                
                    
                    
                })
                    
                }
              })
              .padding(.horizontal)
              
              Spacer(minLength: 0)
          }
        }
      }
  }
  

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}
