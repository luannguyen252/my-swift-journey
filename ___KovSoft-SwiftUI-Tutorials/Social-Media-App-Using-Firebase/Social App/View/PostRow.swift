//
//  PostRow.swift
//  Social App
//
//  Created by Balaji on 16/09/20.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct PostRow: View {
    
    var post : PostModel
    @ObservedObject var postData : PostViewModel
    let uid = Auth.auth().currentUser!.uid
    
    var body: some View {
        
        VStack(spacing: 15){
            
            HStack(spacing: 10){
                
                WebImage(url: URL(string: post.user.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                
                Text(post.user.username)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                
                Spacer(minLength: 0)
                
                // displaying only posted user...
                
                if post.user.uid == uid{
                    
                    Menu(content: {
                        
                        Button(action: {postData.editPost(id: post.id)}) {
                            
                            Text("Edit")
                        }
                        
                        Button(action: {postData.deletePost(id: post.id)}) {
                            
                            Text("Delete")
                        }
                        
                    }, label: {
                        
                        Image("menu")
                            .renderingMode(.template)
                            .resizable()
                            .frame(width: 18, height: 18)
                            .foregroundColor(.white)
                    })
                }
            }
            
            if post.pic != ""{
                
                WebImage(url: URL(string: post.pic)!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width - 60, height: 250)
                    .cornerRadius(15)
            }
            
            HStack{
                
                Text(post.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
            }
            .padding(.top,5)
            
            HStack{
                
                Spacer(minLength: 0)
                
                Text(post.time,style: .time)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
        }
        .padding()
        .background(Color.white.opacity(0.06))
        .cornerRadius(15)
    }
}

