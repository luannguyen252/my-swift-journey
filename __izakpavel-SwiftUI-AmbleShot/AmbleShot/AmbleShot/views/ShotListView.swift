//
//  ShotListView.swift
//  AmbleShot
//
//  Created by myf on 01/11/2019.
//  Copyright © 2019 nerdyak. All rights reserved.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Ellipse())
                .padding()
            Text("No images loaded yet")
                .padding()
            Text("Press start to launch tracking")
                .padding()
            Spacer()
        }
    }
}

struct ShotView: View {
    @ObservedObject var shot: Shot
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Text(self.shot.state == .loading ? "LOADING" : self.shot.displayName())
                    .padding()
                Spacer()
                Text(self.shot.formattedLocation())
                    .padding()
            }
            .background(Color.primary.colorInvert().opacity(0.5))
        }
        .background(
            Image(uiImage: UIImage(contentsOfFile: self.shot.fullImagePath() ?? "") ?? UIImage(named: "placeholder")!)
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
        .cornerRadius(20)
        .frame(height: 200)
    }
}



struct ShotListView: View {
    @EnvironmentObject var locationService: LocationService
    
    var toggleButton: some View {
        Button(action: {
            self.locationService.toggle()
            
        }) {
            Text(self.locationService.running ? "Stop" : "Start")
                .padding()
        }
    }
    
    var body: some View {
        let emptyBackground = EmptyView().opacity(self.locationService.shots.isEmpty ? 1 : 0)
        
        return NavigationView {
            List(self.locationService.shots, id: \.id) { shot in
                NavigationLink(destination: ShotDetailView(shot: shot)) {
                    ShotView(shot: shot)
                }
            }
            .listStyle(PlainListStyle())
            .listRowInsets(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
            .navigationBarTitle(Text("AmbleShot"))
            .navigationBarItems(trailing: toggleButton)
            .overlay(emptyBackground)
        }
        
    }
}

struct ShotListView_Previews: PreviewProvider {
    static var previews: some View {
        ShotListView()
    }
}
