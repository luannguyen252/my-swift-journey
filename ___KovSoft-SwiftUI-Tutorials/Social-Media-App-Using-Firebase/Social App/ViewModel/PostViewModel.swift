//
//  PostViewModel.swift
//  Social App
//
//  Created by Balaji on 16/09/20.
//

import SwiftUI
import Firebase

class PostViewModel : ObservableObject{
    
    @Published var posts : [PostModel] = []
    @Published var noPosts = false
    @Published var newPost = false
    @Published var updateId = ""
    
    
    init() {
        
        getAllPosts()
    }
    
    func getAllPosts(){
        
        ref.collection("Posts").addSnapshotListener { (snap, err) in
            guard let docs = snap else{
                self.noPosts = true
                return
                
            }
            
            if docs.documentChanges.isEmpty{
                
                self.noPosts = true
                return
            }
            
            docs.documentChanges.forEach { (doc) in
                
                // Checking If Doc Added...
                if doc.type == .added{
                    
                    // Retreving And Appending...
                    
                    let title = doc.document.data()["title"] as! String
                    let time = doc.document.data()["time"] as! Timestamp
                    let pic = doc.document.data()["url"] as! String
                    let userRef = doc.document.data()["ref"] as! DocumentReference
                    
                    // getting user Data...
                    
                    fetchUser(uid: userRef.documentID) { (user) in
                        
                        self.posts.append(PostModel(id: doc.document.documentID, title: title, pic: pic, time: time.dateValue(), user: user))
                        // Sorting All Model..
                        // you can also doi while reading docs...
                        self.posts.sort { (p1, p2) -> Bool in
                            return p1.time > p2.time
                        }
                    }
                }
                
                // removing post when deleted...
                
                if doc.type == .removed{
                    
                    let id = doc.document.documentID
                    
                    self.posts.removeAll { (post) -> Bool in
                        return post.id == id
                    }
                }
                
                if doc.type == .modified{
                    
                    // firebase is firing modifed when a new doc writed
                    // I dont know Why may be its bug...
                    print("Updated...")
                    // Updating Doc...
                    
                    let id = doc.document.documentID
                    let title = doc.document.data()["title"] as! String
                    
                    let index = self.posts.firstIndex { (post) -> Bool in
                        return post.id == id
                    } ?? -1
                    
                    // safe Check...
                    // since we have safe check so no worry
                    
                    if index != -1{
                        
                        self.posts[index].title = title
                        self.updateId = ""
                    }
                }
            }
        }
    }
    
    // deleting Posts...
    
    func deletePost(id: String){
        
        ref.collection("Posts").document(id).delete { (err) in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
        }
    }
    
    func editPost(id: String){
        
        updateId = id
        // Poping New Post Screen
        newPost.toggle()
    }
}
