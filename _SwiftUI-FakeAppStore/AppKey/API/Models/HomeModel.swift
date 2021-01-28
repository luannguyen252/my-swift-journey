import Foundation

struct HomeListModel: Identifiable {
    let id = UUID()
    let title: String
    let list: [AppModel]
}

struct HomeModel: Decodable {
    let status: StatusModel
    let ts: String
    let data: DataModel
    let name: String
}

struct StatusModel: Identifiable, Decodable {
    var id = UUID()
    let code: String
    let message: String
}

struct DataModel: Identifiable, Decodable {
    var id = UUID()
    let bannerList: [BannerModel]
    let hotList: [AppModel]
    let specialList: [SpecialModel]
    let popularList: [AppModel]
}

struct BannerModel: Identifiable, Decodable {
    let id: Int
    let type: String
    let title: String
    let picture: String
    let listArea: Int
}

struct SpecialModel: Identifiable, Decodable {
    let id: Int
    let title: String
    let icon: String
    let saveMoney: Float
    let appCount: Float
    let viewCount: Int
    let commentCount: Int
    let desc: String
    let detailIcon: String
}

struct AppModel: Identifiable, Decodable {
    var id = UUID()
    let appId: Int
    let appName: String
    let appIntroduction: String
    let appIcon: String
    let appCategory: String
    let appCategoryCode: String
    let avgScore: Float
    let appSize: String
    let appVersion: String
    let downloadUrl: String
    let supportIpad: String
    let supportIphone: String
    let appBundleId: String
    let miniVersion: String
    let appleId: Int
    let appUrl: String
    let certAccount: String
    let resourceType: String
    let editorDesc: String
    let cornerIcon: String
    let cornerName: String
    let isVip: String
    // let tags: [String]?
    let appType: Int
    let isOpenPlatform: Int
    let appinfo: AppInfoModel
    let isFree: Int
    let im: IMModel
    let areaSupport: Int
    let downloadNotifyApi: Int
    
}

struct AppInfoModel: Identifiable, Decodable {
    var id = UUID()
    let updateDate: String
    let compatible: String
    let language: String?
    let developers: String
}

struct IMModel: Identifiable, Decodable {
    var id = UUID()
    let `default`: String
    let r: Int
    let l: Int
    let d: Int
}
