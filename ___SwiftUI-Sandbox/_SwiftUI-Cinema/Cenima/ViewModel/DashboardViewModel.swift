//
//  DashboardViewModel.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import Foundation
import CoreData
import UIKit

class DashboardViewModel : ObservableObject{
    
    @Published var presentDetailsView : Bool = false
    @Published var imageSaved = false
    @Published var presentFilterView = false
    @Published var entredDataForSearch = ""
    @Published var keyboardType : KeyboardType = .numeric

    var apiClient : API_Client
    private let context = PersistenceController.shared.container.viewContext
    var endPoint : MovieListEndpoint = .nowPlaying
    let group = DispatchGroup()
    
    init(apiClient : API_Client) {

        self.apiClient = apiClient
        
        let apiCalledStatus = UserDefaults.standard
        print("value required \(apiCalledStatus.bool(forKey: "\(MovieListEndpoint.upcoming.description)"))")
        
        group.enter()
        if !apiCalledStatus.bool(forKey: "\(MovieListEndpoint.nowPlaying.description)"){
            callAPI_andSaveData(endPoint: .nowPlaying, page: 1)
        }
        
        if !apiCalledStatus.bool(forKey: "\(MovieListEndpoint.upcoming.description)"){
            callAPI_andSaveData(endPoint: .upcoming, page: 1)
        }
        
        if !apiCalledStatus.bool(forKey: "\(MovieListEndpoint.popular.description)"){
            callAPI_andSaveData(endPoint: .popular, page: 1)
        }

        if !apiCalledStatus.bool(forKey: "\(MovieListEndpoint.topRated.description)"){
            callAPI_andSaveData(endPoint: .topRated, page: 1)
        }
        group.leave()

    }
    
    func changeKeyboardType(type : KeyboardType){
        keyboardType = type
    }
    
    func callAPI_andSaveData(endPoint : MovieListEndpoint, page : Int){
        
                apiClient.fetchMovies(endPoint: endPoint, page: page) { result in
                    
                    switch result{
                    case .success(let data):
                       
                            Database.shared.saveMovie(endPoing: endPoint, listOfMovie: data)
                       
                    case .failure(let error):
                        print("error on fail : \(error)")
                    }
        
                }
    }
  
    
    func decodeTheGenre(genre_Id : Array<Int>) -> String{
        
        let a = genre_Id.map({ (value) -> String in
            return Utils.genreIDValues[value]!
        })

        return a.joined(separator: ", ")
    }
    
    
    func loadMoreData(endPoint : MovieListEndpoint, pageNumber : Int){
        callAPI_andSaveData(endPoint: endPoint, page: pageNumber)
    }
    
    
    func getTheAcrForProgressBar(data : CustomObject) -> CGFloat{
       return CGFloat(((10.0 - Double(data.voteAverage!)!) / 10.0))
    }
    
    
    func filterDataFormLocal(value : CustomObject) -> Bool{
        if entredDataForSearch == ""{
            return true
        }else{
            if keyboardType == .alphabet{
                
                return value.title!.localizedCaseInsensitiveContains("\(entredDataForSearch)")
            }else{
                
                return value.releaseDate!.prefix(4).localizedCaseInsensitiveContains("\(entredDataForSearch)")
                
            }
        }
    }
    
    
    func writeToPhotoAlbum(image: UIImage) {
           UIImageWriteToSavedPhotosAlbum(image, self, nil, nil)
        imageSaved = true
        print("")
    }

      
    
}
