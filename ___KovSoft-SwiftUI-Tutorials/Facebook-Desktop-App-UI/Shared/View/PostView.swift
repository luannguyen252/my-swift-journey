//
//  PostView.swift
//  FB Mac
//
//  Created by Balaji on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostView: View {
    
    @State var post = ""
    
    var body: some View{
        
        ScrollView {
            
            VStack{
                
                // My Post View....
                
                VStack{
                    
                    HStack{
                        
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 35, height: 35)
                            .clipShape(Circle())
                        
                        TextField("What's in your Mind", text: $post)
                            .textFieldStyle(PlainTextFieldStyle())
                    }
                    
                    Divider()
                    
                    HStack{
                        
                        Button(action: {}, label: {
                            
                            Label(
                                title: { Text("Live")
                                    .foregroundColor(.black)
                                },
                                icon: { Image(systemName: "video.fill")
                                    .foregroundColor(.red)
                                })
                                .frame(maxWidth: .infinity)
                            
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical,-5)
                        
                        Button(action: {}, label: {
                            
                            Label(
                                title: { Text("Photos")
                                    .foregroundColor(.black)
                                },
                                icon: { Image(systemName: "photo.on.rectangle")
                                    .foregroundColor(.green)
                                })
                                .frame(maxWidth: .infinity)
                            
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        Divider()
                            .padding(.vertical,-5)
                        
                        Button(action: {}, label: {
                            
                            Label(
                                title: { Text("Room")
                                    .foregroundColor(.black)
                                },
                                icon: { Image(systemName: "video.fill.badge.plus")
                                    .foregroundColor(.purple)
                                })
                                .frame(maxWidth: .infinity)
                            
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(10)
                .background(Color.white)
                .cornerRadius(10)
                
                ScrollView(.horizontal, showsIndicators: false, content: {
                    
                    HStack{
                        
                        Button(action: {}, label: {
                            
                            Label(
                                title: { Text("Create Room") },
                                icon: { Image(systemName: "video.badge.plus")
                                    .foregroundColor(.purple)
                                })
                                .padding(10)
                                .background(Capsule().strokeBorder(Color.purple))
                        })
                        .buttonStyle(PlainButtonStyle())
                        
                        ForEach(users){user in
                            
                            ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
                                
                                WebImage(url: URL(string: user.url)!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 35, height: 35)
                                    .clipShape(Circle())
                                
                                Circle()
                                    .fill(Color.green)
                                    .frame(width: 10, height: 10)
                            })
                        }
                    }
                    .padding()
                })
                .background(Color.white)
                .cornerRadius(10)
                
                ForEach(posts){post in
                    
                    // Post View...
                    
                    PostCardView(post: post)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
