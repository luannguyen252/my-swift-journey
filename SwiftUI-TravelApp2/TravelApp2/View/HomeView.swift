//
//  HomeView.swift
//  TravelApp2
//
//  Created by Luan Nguyen on 23/12/2020.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    var animation: Namespace.ID
    @Binding var show: Bool
    @Binding var selected: Model
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    Text("Explore\nAncient Worlds")
                        .font(.system(size: 32))
                        .fontWeight(.black)
                        .foregroundColor(Color("txt"))

                    Spacer(minLength: 0)

                    Button(action: {}) {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color("color"))
                    }
                } //: HSTACK
                .padding()
                //: SINCE ALL EDGES ARE IGNORED
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 16) {
                        ForEach(1...5, id: \.self) { i in
                            Image("r\(i)")
                                .renderingMode(.original)
                                .onTapGesture {
                                    //: DO SOME STUFF
                                }
                        }
                    } //: HSTACK
                    .padding()
                } //: SCROLLVIEW

                HStack {
                    Text("Destinations")
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(Color("txt"))

                    Spacer()

                    Button(action: {}) {
                        Text("See All")
                            .foregroundColor(.gray)
                    }
                } //: HSTACK
                .padding()

                ForEach(data) { travel in
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .top)) {
                        Image("\(travel.img)")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: 300)
                            .cornerRadius(25)
                            .matchedGeometryEffect(id: travel.img, in: animation)

                        VStack(alignment: .trailing, spacing: 8) {
                            Text(travel.title)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: travel.title, in: animation)

                            Text(travel.country)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .matchedGeometryEffect(id: travel.country, in: animation)
                        } //: VSTACK
                        .padding()
                    } //: ZSTACK
                    .padding()
                    .onTapGesture {
                        withAnimation(.spring()) {
                            selected = travel
                            show.toggle()
                        }
                    }
                }
            } //: VSTACK
        }
    }
}
