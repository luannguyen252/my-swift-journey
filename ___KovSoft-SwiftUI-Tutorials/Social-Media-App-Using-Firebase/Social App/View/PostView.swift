//
//  PostView.swift
//  Social App
//
//  Created by Balaji on 15/09/20.
//

import SwiftUI

struct PostView: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    @StateObject var postData = PostViewModel()
    var body: some View {
        
        VStack{
            
            HStack{
                
                Text("Posts")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                Button(action: {postData.newPost.toggle()}) {
                    
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(Color("blue"))
                }
            }
            .padding()
            .padding(.top,edges!.top)
            // Top Shadow Effect...
            .background(Color("bg"))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if postData.posts.isEmpty{
                
                Spacer(minLength: 0)
                
                if postData.noPosts{
                    
                    Text("No Posts !!!")
                }
                else{
                    
                    ProgressView()
                }
                
                Spacer(minLength: 0)
            }
            else{
                
                ScrollView{
                    
                    VStack(spacing: 15){
                        
                        ForEach(postData.posts){post in
                            
                            PostRow(post: post,postData: postData)
                        }
                    }
                    .padding()
                    .padding(.bottom,55)
                }
            }
        }
        .fullScreenCover(isPresented: $postData.newPost) {
            
            NewPost(updateId : $postData.updateId)
        }
    }
}

