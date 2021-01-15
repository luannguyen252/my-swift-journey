//
//  DataSource.swift
//  SwiftUIScroll
//
//  Created by Gualtiero Frigerio on 25/08/2020.
//

import Foundation

struct Post:Codable,Identifiable {
    var userId:Int
    var id:Int
    var title:String
    var body:String
}

class DataSource {
    
    init() {
        if let fileUrl = Bundle.main.url(forResource: "posts", withExtension: "json"),
           let fileData = try? Data(contentsOf: fileUrl) {
            self.allPosts = getPostsFromData(fileData)
        }
    }
    
    func getAllPost(completion: @escaping ([Post]?) -> Void) {
        completion(allPosts)
    }
    
    func getPosts(page:Int, elementsPerPage:Int, completion:@escaping([Post]?) -> Void) {
        guard let allPosts = self.allPosts else {
            completion(nil)
            return
        }
        let startIndex = elementsPerPage * page
        var endIndex = startIndex + elementsPerPage
        if startIndex >= allPosts.count {
            completion(nil)
            return
        }
        if endIndex >= allPosts.count {
            endIndex = allPosts.count - 1
        }
        let posts = Array(allPosts[startIndex..<endIndex])
        completion(posts)
    }
    
    private var allPosts:[Post]?
    
    private func getPostsFromData(_ data:Data) -> [Post]? {
        let decoder = JSONDecoder()
        var decodedData:[Post]?
        do {
            decodedData = try decoder.decode([Post].self, from: data)
        }
        catch {
            print("decodeData: cannot decode object err \(error)")
        }
        return decodedData
    }
}
