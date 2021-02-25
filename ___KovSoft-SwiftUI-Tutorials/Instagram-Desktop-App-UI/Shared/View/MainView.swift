//
//  MainView.swift
//  Instagram Desktop
//
//  Created by Balaji on 23/12/20.
//

import SwiftUI

struct MainView: View {
    
    var screen = NSScreen.main!.visibleFrame
    @State var search = ""
    
    @State var currentFeed = "Latest"
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                HStack{
                    
                    TextField("Search", text: $search)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.25))
                        .cornerRadius(10)
                    
                    Button(action: {}, label: {
                        
                        Label(
                            title: { Text("Add Photos") },
                            icon: { Image(systemName: "plus.square") })
                            .foregroundColor(.white)
                            .padding(10)
                            .background(gradient)
                            .cornerRadius(10)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .padding(.top,20)
                
                Text("Stories")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // Stories...
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack(spacing: 15){
                        
                        Button(action: {}, label: {
                            
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 65, height: 65)
                                .background(Color.orange.opacity(0.15))
                                .clipShape(Circle())
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        ForEach(1...6,id: \.self){index in
                            
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 55, height: 55)
                                .clipShape(Circle())
                                .padding(5)
                                .background(Circle().stroke(gradient,lineWidth: 2))
                                .clipShape(Circle())
                        }
                        
                    }.padding()
                })
                
                HStack(alignment: .top){
                    
                    Text("Feed")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    ForEach(["Latest","Popular"],id: \.self){type in
                        
                        Button(action: {
                            withAnimation{currentFeed = type}
                        }, label: {
                            
                            VStack(spacing: 8){
                                
                                Text(type)
                                    .foregroundColor(currentFeed == type ? .white : .gray)
                                
                                ZStack{
                                    
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 5, height: 5)
                                    
                                    if currentFeed == type{
                                        
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 5, height: 5)
                                    }
                                }
                            }
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                        
                }
                .padding(.horizontal)
                .padding(.top,8)
                
                // Posts....
                
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 15), count: 2), content: {

                    // Using Only Post Images...
                    // Not Any Specific Arrray For This...
                    
                    ForEach(1...9,id: \.self){index in
                        
                        // PostCardView...
                        
                        PostView(image: "post\(index)")
                    }
                })
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Main"))
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
