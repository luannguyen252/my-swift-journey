//
//  Detail.swift
//  Juice
//
//  Created by Balaji on 03/11/20.
//

import SwiftUI

struct Detail: View {
    @ObservedObject var tabData : TabViewModel
    // for hero animation.....
    var animation: Namespace.ID
    @State var start = false
    @State var cart = 1
    
    @State var isSmall = UIScreen.main.bounds.height < 750
    
    var body: some View {
        
        VStack{
            
            VStack{
                
                ZStack{
                    
                    HStack{
                        
                        Button(action: {
                            
                            withAnimation(Animation.easeIn(duration: 0.5)){
                                start.toggle()
                            }
                            
                            // closing view after animation stops...
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                
                                withAnimation(.spring()){
                                    tabData.isDetail.toggle()
                                }
                            }
                            
                        }) {
                            
                            Image(systemName: "arrow.left")
                                .font(.system(size: 24, weight: .heavy))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            
                            Image(systemName: "bag")
                                .font(.system(size: 24, weight: .heavy))
                                .foregroundColor(.white)
                        }
                    }
                    
                    Text("Besom")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                .padding()
                
                
                ZStack{
                    
                    // rotating view after view appears...
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.init(degrees: start ? -25 : 0), anchor: .bottom)
                        // adjusting View....
                        .offset(x: start ? 15 : 0, y: start ? -15 : 0)
                    // showing view after animation starts...
                        .opacity(start ? 1 : 0)
                    
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .rotationEffect(.init(degrees: start ? 25 : 0), anchor: .bottom)
                        .offset(x: start ? -15 : 0, y: start ? -15 : 0)
                        .opacity(start ? 1 : 0)
                    
                    Image(tabData.selectedItem.image)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: tabData.selectedItem.image, in: animation)
                }
                .frame(height: UIScreen.main.bounds.height / 3)
                .padding(.vertical,25)
            }
            .padding(.bottom)
            .background(Color(tabData.selectedItem.image).clipShape(CustomCorner()))
            
            HStack(spacing: 15){
                
                Button(action: {
                    if cart != 1{cart -= 1}
                }) {
                    
                    Image(systemName: "minus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }
                
                Text("\(cart)")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Button(action: {cart += 1}) {
                    
                    Image(systemName: "plus")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                }
            }
            .padding(.vertical)
            .padding(.horizontal,25)
            .background(Color(tabData.selectedItem.image))
            .cornerRadius(15)
            // white border....
            .background(
            
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white,lineWidth: 1)
            )
            .offset(y: -35)
            .padding(.bottom,-35)
            
            ScrollView(isSmall ? .vertical : .init(), showsIndicators: false) {
                
                VStack{
                    
                    HStack{
                        
                        Text(tabData.selectedItem.title)
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        
                        HStack(spacing: 10){
                            
                            ForEach(1...5,id: \.self){i in
                                
                                Image(systemName: "star.fill")
                                    .font(.title3)
                                    .foregroundColor(i <= 4 ? Color.yellow : Color.black.opacity(0.5))
                            }
                        }
                    }
                    .padding()
                    
                    HStack{
                        
                        Text("Drinking Orange Juice is not only enhances health body also strengthness muscles.")
                            .fontWeight(.semibold)
                            .foregroundColor(Color.black.opacity(0.7))
                            
                        
                        Spacer(minLength: 0)
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        
                        Text("Reviews")
                            .font(.title2)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer(minLength: 0)
                        

                        Button(action: {}) {
                            
                            Text("See All")
                                .fontWeight(.bold)
                                .foregroundColor(.pink)
                        }
                    }
                    .padding()
                    
                    HStack{
                        
                        ForEach(1...4,id: \.self){i in
                            
                            Image("r\(i)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .cornerRadius(10)
                            
                            Spacer(minLength: 0)
                        }
                        
                        Button(action: {}) {
                            
                            Image(systemName: "plus")
                                .foregroundColor(.pink)
                                .frame(width: 55, height: 55)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.pink,style: StrokeStyle(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [10,10]))
                                )
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                    
                    Spacer(minLength: 0)
                    
                    HStack{
                        
                        Text(tabData.selectedItem.price)
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Button(action: {}) {
                            
                            Text("Buy Now")
                                .fontWeight(.heavy)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .padding(.horizontal,25)
                                .background(Color(tabData.selectedItem.image))
                                .cornerRadius(15)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical,isSmall ? 15 : 0)
                }
            }
        }
        .background(
            ZStack{
                
                Color(tabData.selectedItem.image)
                    .ignoresSafeArea(.all, edges: .top)
                
                Color.white
                    .ignoresSafeArea(.all, edges: .bottom)
            }
        )
        .onAppear {
            
            withAnimation(Animation.easeIn.delay(0.5)){
                
                start.toggle()
            }
        }
    }
}
