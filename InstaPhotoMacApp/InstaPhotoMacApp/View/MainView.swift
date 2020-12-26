//
//  MainView.swift
//  InstaPhotoMacApp
//
//  Created by Luan Nguyen on 26/12/2020.
//

import SwiftUI

struct MainView: View {
    var screen = NSScreen.main!.visibleFrame
    @State var search = ""
    @State var currentFeed = "Latest"
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    TextField("Search", text: $search)
                        .textFieldStyle(PlainTextFieldStyle())
                        .padding(.vertical, 8)
                        .padding(.horizontal)
                        .background(Color.white.opacity(0.25))
                        .cornerRadius(8)
                    
                    Button(action: {
                        print("Button Pressed!")
                    }, label: {
                        Label(
                            title: {
                                Text("Add Photos")
                                    .fontWeight(.semibold)
                            },
                            icon: {
                                Image(systemName: "plus.circle.fill")
                                    .font(.title3)
                            })
                            .foregroundColor(.white)
                            .padding(8)
                            .background(gradient)
                            .cornerRadius(8)
                    })
                    .buttonStyle(PlainButtonStyle())
                }
                .padding()
                .padding(.top, 16)
                
                Text("Stories")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                
                // STORIES
                ScrollView(.horizontal, showsIndicators: false, content: {
                    HStack(spacing: 16) {
                        Button(action: {
                            print("Button Pressed!")
                        }, label: {
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundColor(.white)
                                .frame(width: 64, height: 64)
                                .background(Color.pink.opacity(0.15))
                                .clipShape(Circle())
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        ForEach(1...8,id: \.self) { index in
                            Image("p\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 56, height: 56)
                                .clipShape(Circle())
                                .padding(4)
                                .background(Circle().stroke(gradient, lineWidth: 2))
                                .clipShape(Circle())
                        }
                    }
                    .padding()
                })
                
                HStack(alignment: .top) {
                    Text("Feed")
                        .font(.title)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    ForEach(["Latest","Popular"],id: \.self) { type in
                        Button(action: {
                            withAnimation{currentFeed = type}
                        }, label: {
                            VStack(spacing: 8) {
                                Text(type)
                                    .foregroundColor(currentFeed == type ? .white : .gray)
                                
                                ZStack {
                                    Circle()
                                        .fill(Color.clear)
                                        .frame(width: 4, height: 4)
                                    
                                    if currentFeed == type {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 4, height: 4)
                                    }
                                }
                            }
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                        
                }
                .padding(.horizontal)
                .padding(.top,8)
                
                // POSTS
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 2), content: {
                    ForEach(1...9,id: \.self) { index in
                        PostView(image: "post\(index)")
                    }
                })
                .padding()
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("main"))
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
