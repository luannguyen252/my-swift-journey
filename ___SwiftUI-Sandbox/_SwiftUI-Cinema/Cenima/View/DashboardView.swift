//
//  ContentView.swift
//  Cenima
//
//  Created by mohammad mugish on 21/02/21.
//

import SwiftUI
import CoreData
import Kingfisher


struct DashboardView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var dashboardVM : DashboardViewModel
    
    var body: some View {
        NavigationView{
            
            if dashboardVM.presentFilterView{
                
                FilterView(dashboardVM: dashboardVM)
                    .environment(\.managedObjectContext, viewContext)
                    .navigationBarHidden(true)
            }else{
                VStack{
                    
                    HStack{
                        Image(systemName: "film.fill")
                            .font(.system(size: 26, weight: .bold, design: .default))
                        Text("Cenima")
                            .font(.system(size: 26, weight: .bold, design: .default))
                        Spacer()
                        Button(action : {
                            dashboardVM.presentFilterView = true
                        }){
                            Image(systemName: "camera.filters")
                                .font(.system(size: 20, weight: .regular, design: .default))
                                .foregroundColor(Color.black.opacity(0.7))
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    ScrollView(.vertical, showsIndicators: false){
                        
                        NowPlayingMoviedEndPointView(dashboardVM: dashboardVM)
                        
                        PopularMovieEndPointView(dashboardVM: dashboardVM)
                        
                        
                        TopratedMovieEndPointView(dashboardVM: dashboardVM)
                            .padding(.top, 8)
                        
                        UpcomingMovieEndPointView(dashboardVM: dashboardVM)
                            .padding(.top, 8)
                    }
                    .padding(.top, 8)
                }
                .padding(.top, 16)
                .navigationBarHidden(true)
            }
            
            
            
        }
        
        
        
    }
    
}

struct NowPlayingMoviedEndPointView : View {
    @ObservedObject var dashboardVM : DashboardViewModel
    @FetchRequest(entity: NowPlaying.entity(), sortDescriptors:[NSSortDescriptor(keyPath: \NowPlaying.timeStamp, ascending: true)]) var nowPlayingMovies: FetchedResults<NowPlaying>
    @State var imageLoded = false
    @State var presentDetailsView = false
    var body: some View{
        
        VStack(alignment  : .leading, spacing : 0) {
            Text("\(MovieListEndpoint.nowPlaying.description)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(.leading, 20)
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment : .top, spacing : 20) {
                    if nowPlayingMovies.count > 0{
                        ForEach(nowPlayingMovies) { item in
                            ForEach(item.nowPlayingMovie!) { value in
                                GeometryReader { geometry in
                                    
                                    LargeCardView(value: value, nowPlayingMovies: nowPlayingMovies, dashboardVM: dashboardVM)
                                        .rotation3DEffect(Angle(degrees:
                                                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                        ), axis: (x: 0, y: 10.0, z: 0))
                                    
                                    
                                }
                                .frame(width: UIScreen.main.bounds.width / 1.4, height: (UIScreen.main.bounds.height / 1.7) + 120, alignment: .top)
                                .onTapGesture {
                                    presentDetailsView = true
                                }
                                
                                
                                
                            }
                            
                            
                        }
                        
                    }
                }
                
                .padding(.leading, 24)
            }
            
            .frame(width: UIScreen.main.bounds.width, height: (UIScreen.main.bounds.height / 1.7) + 120, alignment: .top)
            
            
        }
        
        
    }
    
    
}

struct LargeCardView : View{
    var value : CustomObject
    var nowPlayingMovies : FetchedResults<NowPlaying>
    @ObservedObject var dashboardVM : DashboardViewModel
    var body : some View{
        ZStack{
            VStack(alignment : .leading) {
                VStack{
                    KFImage.url(URL(string: Utils.urlForImage + value.posterPath!))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width / 1.4, height: (UIScreen.main.bounds.height / 1.7), alignment: .top)
                        .background(Color.black.opacity(0.2))
                    
                    
                    
                    
                }
                .foregroundColor(.white)
                .background(Color.black.opacity(0.1))
                .cornerRadius(30)
                .padding(.top, 16)
                .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0.0, y: 0.0)
                
                .onAppear(perform: {
                    let pageNumber = nowPlayingMovies.count + 1
                    //Call api before last five data shown
                    if nowPlayingMovies.last!.nowPlayingMovie![15] == value{
                        dashboardVM.loadMoreData(endPoint: .nowPlaying, pageNumber: pageNumber)
                    }
                })
                VStack(alignment : .leading, spacing : 2){
                    
                    Text("\(value.title ?? "Title not available")")
                        .font(.system(size: 22, weight: .bold, design: .default))
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    
                    Text("\(dashboardVM.decodeTheGenre(genre_Id: value.genre_ids!))")
                        .font(.system(size: 16, weight: .regular, design: .default))
                        .foregroundColor(Color.black.opacity(0.4))
                    
                    
                }
                .padding(.leading, 8)
                .padding(.top, 16)
                
            }
            
            NavigationLink(
                destination: DetailsView(data: value, dashboardVM: dashboardVM),
                label: {
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                        }
                    }
                })
        }
        
    }
}

struct PopularMovieEndPointView : View {
    
    @ObservedObject var dashboardVM : DashboardViewModel
    @FetchRequest(entity: Popular.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Popular.timeStamp, ascending: true)]) var popularMovies: FetchedResults<Popular>
    
    var body: some View{
        VStack(alignment  : .leading, spacing : 0) {
            Text("\(MovieListEndpoint.popular.description)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment : .top,spacing : 20) {
                    if popularMovies.count > 0{
                        ForEach(popularMovies) { item in
                            ForEach(item.popularMovie!) { value in
                                SmallCardsWithImage(value: value, dashboardVM: dashboardVM)
                                    .onAppear(perform: {
                                        
                                        let pageNumber = popularMovies.count + 1
                                        //Call api before last five data shown
                                        if popularMovies.last!.popularMovie![15] == value{
                                            dashboardVM.loadMoreData(endPoint: .popular, pageNumber: pageNumber)
                                        }
                                    })
                            }
                            .frame(width: 130, height: nil, alignment: .leading)
                            
                            
                            
                        }
                        
                    }
                }
                .padding(.leading, 20)
                
            }
            
            
        }
        
    }
}

struct UpcomingMovieEndPointView : View {
    
    @ObservedObject var dashboardVM : DashboardViewModel
    @FetchRequest(entity: Upcoming.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Upcoming.timeStamp, ascending: true)]) var upcomingMovie: FetchedResults<Upcoming>
    
    var body: some View{
        VStack(alignment  : .leading, spacing : 0) {
            Text("\(MovieListEndpoint.upcoming.description)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(.leading, 20)
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment : .top,spacing : 20) {
                    
                    if upcomingMovie.count > 0{
                        ForEach(upcomingMovie) { item in
                            ForEach(item.upcomingMovie!) { value in
                                VStack{
                                    SmallCardsWithImage(value: value, dashboardVM: dashboardVM)
                                }.onAppear(perform: {
                                    
                                    let pageNumber = upcomingMovie.count + 1
                                    //Call api before last five data shown
                                    if upcomingMovie.last!.upcomingMovie![15] == value{
                                        dashboardVM.loadMoreData(endPoint: .upcoming, pageNumber: pageNumber)
                                    }
                                })
                            }.frame(width: 130, height: nil, alignment: .leading)
                            
                        }
                        
                    }
                }
                .padding(.leading, 20)
            }
            
        }
    }
}

struct TopratedMovieEndPointView: View{
    
    @ObservedObject var dashboardVM : DashboardViewModel
    @FetchRequest(entity: TopRated.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TopRated.timeStamp, ascending: true)]) var topratedMovie: FetchedResults<TopRated>
    
    var body: some View{
        VStack(alignment  : .leading, spacing : 0) {
            Text("\(MovieListEndpoint.topRated.description)")
                .font(.system(size: 18, weight: .bold, design: .default))
                .padding(.leading, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(alignment : .top,spacing : 20)  {
                    if topratedMovie.count > 0{
                        ForEach(topratedMovie) { item in
                            ForEach(item.topRatedMovie!) { value in
                                VStack{
                                    SmallCardsWithImage(value: value, dashboardVM: dashboardVM)
                                }.onAppear(perform: {
                                    
                                    let pageNumber = topratedMovie.count + 1
                                    //Call api before last five data shown
                                    if topratedMovie.last!.topRatedMovie![15] == value{
                                        dashboardVM.loadMoreData(endPoint: .topRated, pageNumber: pageNumber)
                                    }
                                })
                            }.frame(width: 130, height: nil, alignment: .leading)
                        }
                        
                    }
                }
                .padding(.leading, 20)
            }
            
        }
    }
}

struct SmallCardsWithImage : View{
    var value : CustomObject
    @ObservedObject var dashboardVM : DashboardViewModel
    var body: some View{
        ZStack{
            VStack(alignment : .leading, spacing : 10){
                KFImage.url(URL(string: Utils.urlForImage + value.posterPath!))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 180, alignment: .center)
                    .background(Color.black.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.top, 16)
                    .shadow(color: Color.black.opacity(0.3), radius: 6, x: 0.0, y: 0.0)
                
                VStack(alignment : .leading, spacing : 2){
                    Text("\(value.title ?? "Not found")")
                        .font(.system(size: 12, weight: .semibold, design: .default))
                    Text("\(dashboardVM.decodeTheGenre(genre_Id: value.genre_ids!))")
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                        .font(.system(size: 12, weight: .semibold, design: .default))
                        .foregroundColor(Color.black.opacity(0.3))
                        .frame(width: nil, height: 30, alignment: .leading)
                }
            }
            NavigationLink(
                destination: DetailsView(data: value, dashboardVM: dashboardVM),
                label: {
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                        }
                    }
                })
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        DashboardView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
