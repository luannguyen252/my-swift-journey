import SwiftUI

struct ResultData: Decodable {
    var code: Int
    var data: Data_Code
}

struct Data_Code: Decodable {
    var stateCode: Int
    var message: String
    var returnData: ReturnData
}

struct ReturnData: Decodable {
    var communityList: [CommunityList]
    var hasMore: Bool
    var nextPage: Int
    var navList: [NavList]
    var showPageName: String
    var DefaultNav: DefaultNavList
}

struct CommunityList: Decodable {
    var community_id: String
    var title: String
    var status: Int
    var reply_total: Int
    var praise_total: Int
    var cc_share: Int
    var cc_business: Int
    var cover: String
    var is_up: Int
    var content: String
    var user: Users
    var tag_list: [Taglist]
    var image_num: Int
    var image_list: [Image_list]
    var is_follow: Int
    var create_time_str: String
    
    struct Users: Decodable {
        var face: String
        var nickname: String
        var user_id: Int
        var vip_level: Int
        var group_user: Int
    }
}

struct Taglist: Decodable {
    var tag_name: String
    var color: String
    var tag_total: Int
    var tag_id: String
}

struct Image_list: Decodable {
    var image_id: String
    var width: Int
    var high: Int
    var url: String
    var unique_key: String
    var ori_url: String
    var size: String
    var sort: Int
    var image_type: Int
}

struct NavList: Decodable {
    var title: String
    var nav_id: Int
}

struct DefaultNavList: Decodable {
    var default_title: String
    var default_nav_id: Int
}

struct ContentView: View {
    @State var communityList = [CommunityList]()
    @State var taglist = [Taglist]()
    
    var body: some View {
        NavigationView {
            List(communityList, id: \.community_id) { item in
                HStack(alignment: .top, spacing: 10) {
                    URLImage(url: item.user.face).scaledToFill().shadow(radius: 8).cornerRadius(10).frame(width: 80, height: 80).cornerRadius(80).padding(.trailing, 4)

                    VStack(alignment: .leading, spacing: 6) {
                        Text(item.user.nickname)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)))
                        
                        Text(item.content)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        HStack(spacing: 12) {
                            Text(item.create_time_str)
                                .font(.caption)
                                .foregroundColor(Color(#colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)))
                            Spacer()
                            
                            Text(item.title)
                                .fontWeight(.bold)
                                .font(.subheadline)
                                .padding(.vertical,10)
                                .padding(.horizontal,15)
                                .background(Color.primary.opacity(0.06))
                                .foregroundColor(Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)))
                                .clipShape(Capsule())
                        }
                    }

                    Spacer(minLength: 0)
                }
            }
            .onAppear(perform: self.loadData)
            .navigationBarTitle(Text("SwiftUI JSON"))
        }
    }
    
    func loadData() {
        let time = Int32(Date().timeIntervalSince1970)
        let page = 1
        guard let url = URL(string: "http://app.u17.com/v3/appV3_3/ios/phone/community/communityList?device_id=DBA91728-0D4B-4FA2-BAC5-4D9448551E91&key=859a2cf8b25c91fefc5a9ddfc258fd54aff7fa02b482f78b563ff635bdd52bf4d134af6e970681a1f53109bc91f0c7c865f140317c7a6076d74211707665c401cf7d9872a5fbf6a0c487ef987afb5607170f6edc199aaf60f914b3b77424a3add4c80bababe8535cb598606fc88ea1c72325ed8b8737380be57523fa8b76d03a4db52ebb1e7c2259b55228122ea57f10318b0de79cf7a5f4e2576b24d5fa14f878a86c43bd97a7febb2c960a55481ae65aaa24363c6c9f31d7a9d328c473548b0fd014c550b49aeb033ffdc317fc8908a480ec92adfea9346d8d3b929b28e86066bc72015d94445088dbbc648e654621eddac317a10739c7aef5566459620644cf01a692bf14c5f4%3A%3A%3Aopen&model=iPhone%2011&nav_id=2&page=\(page)&systemVersion=13.4.1&target=U17_3.0&time=\(time)&version=5.2.0") else {
            
            return
        }
        print("\(url)")
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let jsonResponse = try JSONDecoder().decode(ResultData.self, from: data)
                    DispatchQueue.main.async {
                        self.communityList = jsonResponse.data.returnData.communityList
                        print("\(jsonResponse.data.returnData.communityList)")
                        
                    }
                }catch let jsonError as NSError {
                    print("Json error:\(String(describing: jsonError.localizedDescription))")
                }
            }
            print("Featch error:\(String(describing: error?.localizedDescription))")
        }
        .resume()
    }
}

struct URLImage: View {
    let url: String
    let placeholder: String
    
    @ObservedObject var imageLoader = ImageLoader()
    
    init(url: String, placehloder: String = "placeholder") {
        self.url = url
        self.placeholder = placehloder
        self.imageLoader.downloadImgae(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageLoader.downloadedData {
            return Image(uiImage: UIImage(data: data)!).renderingMode(.original).resizable()
        } else{
            return Image("placeholder").renderingMode(.original).resizable()
        }
    }
}

class ImageLoader: ObservableObject {
    @Published var downloadedData: Data?
    
    func downloadImgae(url: String) {
        guard let imageURL = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.downloadedData = data
            }
        }
        .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
