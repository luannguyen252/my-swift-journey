import Foundation
import SwiftUI
import Combine

protocol FetchDelegate {
    func dispatch(_ data: Data?)
}

class HomeManager: Fetch, ObservableObject, FetchDelegate {
    @Published var homeList: [HomeListModel] = []
    @Published var specialList: [SpecialModel] = []
    @Published var banners: [BannerModel] = []
    
    override init() {
        super.init()
        self.delegate = self
        self.uri = "https://apinew.tutuapp.net/lite/app/home?lang=es-es"
        self.fetch()
    }
    
    func dispatch(_ data: Data?) {
        do {
            let response = try JSONDecoder().decode(HomeModel.self, from: data!)
            DispatchQueue.main.async {
                
                var lists: [HomeListModel] = []
                
                let populateList = HomeListModel(title: "Populares", list: response.data.popularList)
                let hotList = HomeListModel(title: "Tendencias", list: response.data.hotList)
                
                lists.append(hotList)
                lists.append(populateList)
                
                self.banners = response.data.bannerList
                self.specialList = response.data.specialList
                self.homeList = lists
                
            }
        } catch {
            print("Failed to decode JSON:", error)
        }
    }
    
}

class Fetch {
    internal var uri: String?
    internal var model: Decodable.Protocol?
    internal var delegate: FetchDelegate?
    
    internal func fetch() {
        guard let url = URL(string: self.uri ?? "") else { return }
        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            self.delegate?.dispatch(data)
        }
        .resume()
    }
}
