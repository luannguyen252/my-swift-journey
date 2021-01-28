import SwiftUI

struct HomeView: View {
    @ObservedObject var homeManager: HomeManager = HomeManager()
    
    init() {
        UITableView.appearance().separatorStyle = .none
    }
    
    var body: some View {
        NavigationView {
            List {
                BannerRow(homeManager.banners)
                TrendyRow(homeManager.homeList.first ?? HomeListModel(title: "", list: []))
                SpecialRow(homeManager.specialList)
                AppRow(homeManager.homeList.last ?? HomeListModel(title: "", list: []))
                }.navigationBarTitle("Home")
        }
    }
}

struct SpecialRow: View {
    let specialList: [SpecialModel]
    
    init(_ specialList: [SpecialModel]) {
        self.specialList = specialList
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            Text("Especiales").font(.title).fontWeight(.semibold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack (alignment: .top, spacing: 16) {
                    ForEach(self.specialList) { banner in
                        RemoteImage(url: URL(string: banner.icon)!, errorView: { error in
                            Text(error.localizedDescription)
                        }, imageView: { image in
                            image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 240, height: 80, alignment: .center)
                            .cornerRadius(5)
                            .clipped()
                        }) {
                            Color.gray
                            .frame(width: UIScreen.main.bounds.width - 240, height: 80)
                            .cornerRadius(5)
                        }
                    }
                }
            }
        }.padding(.vertical, 16)
    }
}

struct TrendyRow: View {
    let apps: HomeListModel
    
    init(_ apps: HomeListModel) {
        self.apps = apps
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            Text(apps.title).font(.title).fontWeight(.semibold)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.apps.list) { app in
                        RemoteImage(url: URL(string: app.appIcon)!, errorView: { error in
                            Text(error.localizedDescription)
                        }, imageView: { image in
                            image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)
                            .clipped()
                        }) {
                            Color.gray
                            .frame(width: 80, height: 80, alignment: .center)
                            .cornerRadius(15)
                        }
                    }
                }
            }
        }
    }
}

struct BannerRow: View {
    let banners: [BannerModel]
    
    init(_ banners: [BannerModel]) {
        self.banners = banners
    }
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.banners) { banner in
                        RemoteImage(url: URL(string: banner.picture)!, errorView: { error in
                            Text(error.localizedDescription)
                        }, imageView: { image in
                            image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: UIScreen.main.bounds.width - 64, height: 160)
                            .cornerRadius(15)
                            .clipped()
                        }) {
                            Color.gray
                            .frame(width: UIScreen.main.bounds.width - 64, height: 160, alignment: .center)
                            .cornerRadius(15)
                        }
                    }
                }
            }
        }
    }
}

struct AppRow: View {
    let list: HomeListModel
    
    init(_ list: HomeListModel) {
        self.list = list
    }
    
    var body: some View {
        VStack (alignment: .leading, spacing: 8) {
            Text(list.title).font(.title).fontWeight(.semibold)
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(list.list) { app in
                        AppCell(model: app)
                    }
                }
            }
        }
    }
}

struct AppCell: View {
    let app: AppModel
    
    init(model: AppModel) {
        self.app = model
    }
    
    var body: some View {
        ZStack {
            HStack (alignment: VerticalAlignment.center, spacing: 8) {
                RemoteImage(url: URL(string: app.appIcon)!, errorView: { error in
                    Text(error.localizedDescription)
                }, imageView: { image in
                  image
                  .resizable()
                  .aspectRatio(contentMode: .fill)
                }, loadingView: {
                    Text("Loading ...")
                }).frame(width: 70.0, height: 70.0, alignment: .leading).cornerRadius(10)
                .clipped()
                
               VStack (alignment: .leading, spacing: 8) {
                Text(app.appName).font(.system(Font.TextStyle.headline)).fontWeight(.semibold).lineLimit(2)
                Text(app.appVersion).font(.system(Font.TextStyle.subheadline))
               }
                Spacer()
                Button(action: {
                    print("DESCARGAR")
                }) {
                    Text("OBTENER")
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(Color(red: 254/255, green: 44/255, blue: 102/255).opacity(0.2))
                    .foregroundColor(Color(red: 254/255, green: 44/255, blue: 102/255))
                    .cornerRadius(25)
                    .font(Font.body.weight(.bold))
                }
            }.padding(.vertical, 8)
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
