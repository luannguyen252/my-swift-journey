//
//  DataSource.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation

enum Endpoint {
    case Repository(name:String)
    case Stargazers(owner:String, name:String, page:Int)
    case User(name:String)
}

enum DataSourceError {
    case NetworkError
    case DataError
}

class DataSource {
    var baseURLString:String!
    var restClient:RESTClient!
    
    init(withClient client:RESTClient, baseURLString:String) {
        self.restClient = client
        self.baseURLString = baseURLString
    }
    
    func getRepositories(forUser user:String, completion:@escaping([Repository]?, DataSourceError?) -> Void) {
        getData(atEndpoint: .Repository(name: user), withType: [Repository].self) { data, error in
            let repositories = data as? [Repository]
            completion(repositories, error)
        }
    }
    
    func getStargazers(owner:String, repo:String, page:Int, completion: @escaping([User]?, DataSourceError?) -> Void) {
        getData(atEndpoint: .Stargazers(owner: owner, name: repo, page:page), withType: [User].self) { data, error in
            let stargazers = data as? [User]
            completion(stargazers, error)
        }
    }
    
    func getUser(withName name:String, completion: @escaping(User?) -> Void) {
        getData(atEndpoint: .User(name: name), withType: User.self) { data, error in
            let user = data as? User
            completion(user)
        }
    }
}

//MARK:- Private

extension DataSource {
    private func decodeData<T>(data:Data, type:T.Type) -> Decodable? where T:Decodable {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        var decodedData:Decodable?
        do {
            decodedData = try decoder.decode(type, from: data)
        }
        catch {
            print("decodeData: cannot decode object err \(error)")
        }
        return decodedData
    }
    
    private func getData<T>(atEndpoint endpoint: Endpoint, withType type:T.Type, completion:@escaping (Decodable?, DataSourceError?) ->Void) where T:Decodable {
        guard let url = getURL(forEndpoint: endpoint) else {
            completion(nil, .NetworkError)
            return
        }
        restClient.getData(atURL: url, completion: { (data) in
            guard let data = data else {
                completion(nil, .NetworkError)
                return
            }
            let decodedData = self.decodeData(data: data, type:type)
            var error:DataSourceError?
            if decodedData == nil {
                error = .DataError
            }
            completion(decodedData, error)
        })
    }
    
    private func getURL(forEndpoint endpoint:Endpoint) -> URL? {
        var urlString:String?
        switch endpoint {
        case .Repository(let name):
            urlString = baseURLString + "/users/" + name + "/repos"
        case .Stargazers(let owner, let repo, let page):
            urlString = baseURLString + "/repos/" + owner + "/" + repo + "/stargazers?page=\(page)"
        case .User(let name):
            urlString = baseURLString + "/users/" + name
        }
        guard let string = urlString else {return nil}
        return URL(string: string)
    }
}
