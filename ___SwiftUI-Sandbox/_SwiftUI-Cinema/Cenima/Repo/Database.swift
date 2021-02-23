//
//  Database.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import Foundation
import CoreData

class Database {
    private let context = PersistenceController.shared.container.viewContext
    static var shared : Database = Database()
    let apiCalledStatus = UserDefaults.standard
    func saveMovie(endPoing : MovieListEndpoint, listOfMovie : [CustomObject] ){
        switch endPoing {
        case .nowPlaying:
            let nowPlaying = NowPlaying(context: context)
            nowPlaying.nowPlayingMovie = listOfMovie
            nowPlaying.timeStamp = Date()
        case .popular:

            let popular = Popular(context: context)
            popular.popularMovie = listOfMovie
            popular.timeStamp = Date()
            
        
        case .topRated:
            let topRated = TopRated(context: context)
            topRated.topRatedMovie = listOfMovie
            topRated.timeStamp = Date()
        case .upcoming:
            let upcoming = Upcoming(context: context)
            upcoming.upcomingMovie = listOfMovie
            upcoming.timeStamp = Date()
        }
        
        
        do{
            try context.save()
            
            if !apiCalledStatus.bool(forKey: endPoing.description){
                apiCalledStatus.setValue(true, forKey: endPoing.description)
            }
        print("Saved:")
            
        }catch{
          
            print("error while saving\(error)")
        }
        
    }
    
    
}
