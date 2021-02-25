//
//  StickyView.swift
//  SquareSpace (iOS)
//
//  Created by Balaji on 25/01/21.
//

import SwiftUI

struct StickyView: View {
    
    @Binding var firstMinY: CGFloat
    @Binding var minY: CGFloat
    @Binding var lastMinY: CGFloat
    @Binding var scale: CGFloat
    
    var body: some View {
        
        
        GeometryReader{reader -> AnyView in
            
            // Eliminating The Header View Height From Image...
            
            let minY = self.firstMinY - reader.frame(in: .global).minY
            
            // Scaling View....
            // to avoid negatives....
            
            // your own value for scaling Effect...
            let progress = (minY > 0 ? minY : 0) / 200
            
            let scale = (1 - progress) * 1
            
            // Image Scaling....
            
            // Only 0.1 Scaling For Inner Image....
            let imageScale = (scale / 0.6) > 0.9 ? (scale / 0.6) : 0.9
            
            // Image Offset.....
            
            let imageOffset = imageScale > 0 ? (1 - imageScale) * 200 : 20
            DispatchQueue.main.async {
                if self.firstMinY == 0{
                    self.firstMinY = reader.frame(in: .global).minY
                }
                self.minY = minY
                
                // Getting Last MInY Value When The Scale Reached 0.4....
                
                if scale < 0.4 && lastMinY == 0{
                    
                    self.lastMinY = minY
                }
 
                
                self.scale = scale
            }
            
            return AnyView(
            
                Image("p5")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: getScreen().width, height: getScreen().height - firstMinY)
                    .cornerRadius(1)
                    .scaleEffect(scale < 0.6 ? imageScale : 1)
                    .offset(y: scale < 0.6 ? imageOffset : 0)
                    .overlay(
                    
                        ZStack{
                            
                            VStack{
                                
                                Text("CREATE WEBSITE")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                
                                Text("The leader in\nwebsite design")
                                    .font(.title)
                                    .fontWeight(.heavy)
                                    .multilineTextAlignment(.center)
                                    .padding(.top,10)
                            }
                            .foregroundColor(.white)
                            .offset(y: 15)
                            // Hiding...
                            // Hiding Before scale 0.6....
                            .opacity(Double(scale - 0.7) / 0.3)
                            
                            // Showing Info Details...
                            
                            Text("Seattle Based\nPhotographer")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .scaleEffect(1.5)
                                .opacity(0.1 - Double(scale - 0.7) / 0.3)
                        }
                    )
                    .background(
                    
                        ZStack{
                            
                            // Only SHowing After o.6...
                            if scale < 0.6{
                                
                                // BG And Info Card...
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(Color.white.opacity(0.6))
                                
                                VStack{
                                    
                                    HStack{
                                        
                                        Text("Mark Novo")
                                            .font(.title)
                                            .fontWeight(.bold)
                                        
                                        Spacer()
                                        
                                        ForEach(1...3,id: \.self){_ in
                                            
                                            
                                            Circle()
                                                .fill(Color.gray)
                                                .frame(width: 15, height: 15)
                                        }
                                    }
                                    .padding()
                                    
                                    Spacer()
                                }
                            }
                        }
                    )
                    // Limiting....
                    .scaleEffect(scale > 0.6 ? scale : 0.6)
                    // Loginc to move view Up When It Reaches Button....
                    .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
                // Offset....
                    .offset(y: scale > 0.6 ? (scale - 1) * 200 : -80)
            )
        }
        .frame(width: getScreen().width, height: getScreen().height - firstMinY)
        .overlay(
        
            // Bottom Details...
            
            VStack{
                
                Text("Stand Out Online with a professional\nwebsite,online store, or portfolio.")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                Button(action: {}, label: {
                    Text("Get Started")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.vertical)
                        .padding(.horizontal,30)
                        .background(Color.white)
                })
                .padding(.top,10)
            }
            .padding(.bottom, 70)
            // Disabling Scroll...
            .offset(y: minY > 0 ? minY > lastMinY + 60 && lastMinY != 0 ? lastMinY + 60 : minY : 0)
            // thas all the logic when ever the scroll reached button it will eanble full scroll....
            ,
            alignment: .bottom
        )
    }
}

struct StickyView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
