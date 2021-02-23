//
//  API_Client.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import Foundation
import CoreData


class API_Client : MovieService{
    
    private let apiKey = "d61ee77f7b76c584ec9ebdb0d6a1e15e"
    private let baseAPIURL = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    func fetchMovies(endPoint : MovieListEndpoint, page : Int, completionHangler: @escaping (Result<[CustomObject], MovieError>) -> ()) {
        
        guard let url = URL(string: "\(baseAPIURL)/movie/\(endPoint.rawValue)?api_key=\(apiKey)&page=\(page)") else {
            completionHangler(.failure(.invalidEndpoint))
            
            return
        }
        
       
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in

            guard let data = data else{
                print("No inter connection found")
                completionHangler(.failure(.noData))
                return
            }
            
           
            let parent = PersistenceController.shared.container.viewContext
              let childContext = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
              childContext.parent = parent
            
            
            do{
                let decoder = JSONDecoder(context: childContext)
            
                switch endPoint{
                case .nowPlaying:
                    let decodeData  =  try decoder.decode(NowPlaying.self, from: data)
                    completionHangler(.success(decodeData.nowPlayingMovie!))
                case .popular:
                    let decodeData  =  try decoder.decode(Popular.self, from: data)
                    completionHangler(.success(decodeData.popularMovie!))
                case .topRated:
                    let decodeData  =  try decoder.decode(TopRated.self, from: data)
                    completionHangler(.success(decodeData.topRatedMovie!))
                case .upcoming:
                    let decodeData  =  try decoder.decode(Upcoming.self, from: data)
                    completionHangler(.success(decodeData.upcomingMovie!))
                }
                
            }catch{
                print("Error while decoding \(error)")
                completionHangler(.failure(.serializationError))
            }
            
            

        }
        
        task.resume()

       
    }
    
 
    
    

    
}


protocol MovieService {
    func fetchMovies(endPoint : MovieListEndpoint, page : Int, completionHangler : @escaping (Result<[CustomObject], MovieError>) -> ())
  
}
