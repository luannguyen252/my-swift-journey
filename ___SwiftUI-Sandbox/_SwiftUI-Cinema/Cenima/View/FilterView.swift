//
//  FilterView.swift
//  Cenima
//
//  Created by mohammad mugish on 22/02/21.
//

import SwiftUI
import Kingfisher

struct FilterView : View{
    
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var dashboardVM : DashboardViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @FetchRequest(entity: NowPlaying.entity(), sortDescriptors:[NSSortDescriptor(keyPath: \NowPlaying.timeStamp, ascending: true)]) var nowPlayingMovies: FetchedResults<NowPlaying>
    @FetchRequest(entity: Popular.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Popular.timeStamp, ascending: true)]) var popularMovies: FetchedResults<Popular>
    @FetchRequest(entity: Upcoming.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Upcoming.timeStamp, ascending: true)]) var upcomingMovie: FetchedResults<Upcoming>
    @FetchRequest(entity: TopRated.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \TopRated.timeStamp, ascending: true)]) var topratedMovie: FetchedResults<TopRated>
    
    var body: some View{
        
        VStack{
            navigationBarWithSearchBar
            
            ScrollView(.vertical, showsIndicators: false){
                
                LazyVStack(alignment : .leading){
                    
                    ForEach(nowPlayingMovies, id : \.self) { item in
                        ForEach(item.nowPlayingMovie!.filter({ (value) -> Bool in
                            
                            dashboardVM.filterDataFormLocal(value: value)
                            
                        }), id: \.uniqueID) { value in
                            CardViewForFilter(data: value, dashboardVM: dashboardVM)
                        }
                    }
                    
                    ForEach(popularMovies, id : \.self) { item in
                        ForEach(item.popularMovie!.filter({ (value) -> Bool in
                            
                            dashboardVM.filterDataFormLocal(value: value)
                            
                        }), id: \.uniqueID) { value in
                            CardViewForFilter(data: value, dashboardVM: dashboardVM)
                        }
                    }
                    
                    ForEach(topratedMovie, id : \.self) { item in
                        ForEach(item.topRatedMovie!.filter({ (value) -> Bool in
                            
                            dashboardVM.filterDataFormLocal(value: value)
                            
                        }), id: \.uniqueID) { value in
                            
                            CardViewForFilter(data: value, dashboardVM: dashboardVM)
                            
                        }
                    }
                    
                    ForEach(upcomingMovie, id : \.self) {  item in
                        ForEach(item.upcomingMovie!.filter({ (value) -> Bool in
                            
                            dashboardVM.filterDataFormLocal(value: value)
                            
                        }), id: \.uniqueID) { value in
                            CardViewForFilter(data: value, dashboardVM: dashboardVM)
                        }
                        
                    }
                    
                    
                    
                    
                    
                }
                .padding(.top, 16)
            }
            .padding(.top, 8)
            
        }
        .onTapGesture {
            hideKeyboard()
        }
        .ignoresSafeArea(.container, edges: .bottom)
        
    }
    
    var navigationBarWithSearchBar : some View{
        HStack{
            Button(action : {
                dashboardVM.entredDataForSearch = ""
                dashboardVM.presentFilterView = false
            }){
                Image(systemName: "arrow.backward")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.blue)
                    .shadow(color: Color.white.opacity(0.6), radius: 6, x: 0.0, y: 0.0)
                
            }
            
            ZStack{
                
                Color.black
                    .opacity(0.1)
                    .frame(width: nil, height: 38, alignment: .center)
                    .cornerRadius(30)
                
                
                
                TextField(dashboardVM.keyboardType == .numeric ? "Search by year" : "Search by name", text: $dashboardVM.entredDataForSearch)
                    .keyboardType(dashboardVM.keyboardType == .numeric ? .numberPad : .alphabet)
                    .padding(.leading, 16)
                
            }
            
            Menu {
                Button(action : {
                    dashboardVM.entredDataForSearch = ""
                    hideKeyboard()
                    dashboardVM.keyboardType = .numeric
                }){
                    Label("Search by Year", systemImage:
                            
                            dashboardVM.keyboardType == .numeric ? "checkmark" : "")
                    
                    
                }
                Button(action : {
                    dashboardVM.entredDataForSearch = ""
                    hideKeyboard()
                   
                    dashboardVM.keyboardType = .alphabet
                }){
                    Label("Search by Name", systemImage: dashboardVM.keyboardType == .alphabet ? "checkmark" : "")
                    
                }
                
            } label: {
                Image(systemName: "text.redaction")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .foregroundColor(.blue)
                    .shadow(color: Color.white.opacity(0.6), radius: 6, x: 0.0, y: 0.0)
            }
            
            
        }
        .padding(.top, 16)
        .padding(.horizontal, 16)
        
    }
}

struct CardViewForFilter : View{
    var data : CustomObject
    var dashboardVM : DashboardViewModel
    var body: some View{
        
        ZStack(alignment : .topLeading) {
            
            HStack(alignment : .bottom, spacing : 0){
                VStack{
                    VStack(alignment : .leading, spacing : 3){
                        Text(data.title!)
                            .font(.system(size: 20, weight: .semibold, design: .default))
                        Text(data.releaseDate!)
                        Text(dashboardVM.decodeTheGenre(genre_Id: data.genre_ids!))
                        
                        ProgressBar(arcAngle: dashboardVM.getTheAcrForProgressBar(data : data), rating: "\(data.voteAverage ?? "0.0")",size: 32)
                    }.padding(.leading, 110)
                    .padding(.top, 8)
                    
                    //                    Text(data.overview!)
                }.frame(width: UIScreen.main.bounds.width - 16, height: 125, alignment: .topLeading)
                .background(Color.black.opacity(0.1))
                .cornerRadius(20, corners: .allCorners)
                .frame(width: UIScreen.main.bounds.width - 16, height: 150, alignment: .bottom)
                
                
            }.frame(width: nil, height: 150, alignment: .top)
            .padding(.horizontal,8)
            
            KFImage(URL(string: Utils.urlForImage + data.posterPath!))
                .resizable()
                .frame(width: 100, height: 150, alignment: .top)
                .aspectRatio(contentMode: .fit)
                .background(Color.black.opacity(0.2))
                .cornerRadius(20, corners: .allCorners)
                .padding(.leading, 8)
            
            NavigationLink(
                destination: DetailsView(data: data, dashboardVM: dashboardVM)
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true),
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
