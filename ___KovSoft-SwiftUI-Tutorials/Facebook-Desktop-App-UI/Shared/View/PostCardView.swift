//
//  PostCardView.swift
//  FB Mac
//
//  Created by Balaji on 15/12/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCardView: View {
    
    var post: Post
    
    var body: some View{
        
        VStack{
            
            HStack{
                
                WebImage(url: URL(string: post.user.url)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 35, height: 35)
                    .clipShape(Circle())
                
                VStack(alignment: .leading, spacing: 5, content: {
                    Text(post.user.name)
                        .foregroundColor(.black)
                    
                    HStack(spacing: 5){
                        
                        Text(post.postTime)
                            .foregroundColor(.gray)
                        
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 3, height: 3)
                        
                        Image(systemName: "globe")
                            .foregroundColor(.gray)
                    }
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    
                    Image("menu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 18, height: 18)
                        .foregroundColor(.black)
                        .rotationEffect(.init(degrees: 90))
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal,10)
            
            Text(post.title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal,10)
            
            WebImage(url: URL(string: post.imageUrl)!)
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            HStack{
                
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(Color("fb"))
                
                Text("\(post.likes)")
                
                Spacer()
                
                Text("\(post.comments) Comments")
                    .foregroundColor(.gray)
                
                Text("\(post.shares) Shares")
                    .foregroundColor(.gray)
            }
            .padding(.horizontal,10)
            .padding(.top,5)
            
            Divider()
            
            HStack{
                
                Button(action: {}, label: {
                    
                    Label(
                        title: { Text("Like")
                           
                        },
                        icon: { Image(systemName: "hand.thumbsup")
                            
                        })
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                    
                })
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical,-5)
                
                Button(action: {}, label: {
                    
                    Label(
                        title: { Text("Comment")
                           
                        },
                        icon: { Image(systemName: "arrow.up.message")
                            
                        })
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                    
                })
                .buttonStyle(PlainButtonStyle())
                
                Divider()
                    .padding(.vertical,-5)
                
                Button(action: {}, label: {
                    
                    Label(
                        title: { Text("Share")
                           
                        },
                        icon: { Image(systemName: "square.and.arrow.up")
                            
                        })
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity)
                    
                })
                .buttonStyle(PlainButtonStyle())
            }
            .padding(.horizontal,10)
            .padding(.top,10)
        }
        .padding(.vertical)
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct PostCardView_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
