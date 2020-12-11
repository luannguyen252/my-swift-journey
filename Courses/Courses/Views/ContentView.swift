//
//  ContentView.swift
//  Courses
//
//  Created by Luan Nguyen on 11/12/2020.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var row = Array(repeating: GridItem(.fixed(220), spacing: 20), count: 1)
    
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: Alignment.top) {
            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 50)
                        .foregroundColor(Color("profile"))
                        .overlay(Image("user").resizable()).cornerRadius(8)
                    
                    Text("Luan Nguyen")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                    
                    Button(action: {
                    }) {
                        Image(systemName: "magnifyingglass")
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                    }
                } //: HSTACK
                
                HStack {
                    Text("Your Course")
                        .font(.title3)
                        .fontWeight(.bold)
                    
                    Spacer()
                } //: HSTACK
                .padding(.top, 50)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: row, spacing: 14) {
                        ForEach(cData){ course in
                            VStack(alignment: .leading, spacing: 15) {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundColor(Color(course.iconColor))
                                    .overlay(Image(course.icon).resizable().frame(width:30, height: 30))
                                    .frame(width: 40, height: 40)
                                
                                Text(course.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                                HStack(spacing: 10) {
                                    Image(systemName: "stopwatch")
                                        .foregroundColor(Color(course.iconColor))
                                    
                                    Text(course.date)
                                        .foregroundColor(.white)
                                } //: HSTACK
                                ZStack {
                                    Image("profile-pic")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(8)
                                    
                                    Image("profile-pic")
                                        .resizable()
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(8)
                                        .offset(x:15)
                                    
                                    RoundedRectangle(cornerRadius: 8)
                                        .foregroundColor(.white)
                                        .overlay(Text("+9").foregroundColor(Color(course.cardColor)))
                                        .frame(width: 40, height: 40)
                                        .offset(x:30)
                                } //: ZSTACK
                            }
                            .padding(.horizontal, 20)
                            .padding(.vertical, 20)
                            .frame(width: 160)
                            .background(Color(course.cardColor))
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                    } //: LAZYHGRID
                } //: SCROLLVIEW
                
                HStack {
                    Text("Popular Course")
                        .fontWeight(.bold)
                        .font(.title3)
                    Spacer()
                } //: HSTACK
                .padding(.top, 20)
                
                // You can make this a paging carousel, i will link the tutorial in the description
                Image("pager")
                    .resizable()
                    .cornerRadius(20)
                    .frame(height: ((UIScreen.main.bounds.width - 60) * 9) / 16)
            }
            .padding(.top, 50)
            .padding(.horizontal, 30)
            
            DragView {
                VStack(alignment: .leading) {
                    Text("Scedule")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.horizontal, 30)
                    
                    HStack {
                        Text("We have 5 course today")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Button(action: {
                        }) {
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                    } //: HSTACK
                    .padding(.top, 5)
                    .padding(.horizontal, 30)
                    
                    ScrollView {
                        LazyVStack (alignment: .leading, spacing: 30) {
                            ForEach(lData) { list in
                                VStack(alignment: .leading, spacing: 10) {
                                    HStack(spacing: 15) {
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(Color(list.iconColor))
                                            .overlay(Image(list.icon).resizable().frame(width:30, height: 30))
                                            .frame(width: 50, height: 50)
                                        
                                        VStack (alignment: .leading, spacing: 10) {
                                            Text(list.name)
                                                .font(.title3)
                                                .foregroundColor(.white)
                                            
                                            Text(list.timing)
                                                .font(.subheadline)
                                                .foregroundColor(.white)
                                        } //: VSTACK
                                    } //: HSTACK
                                    .padding(.horizontal, 30)
                                    
                                    Divider()
                                        .background(Color.white.opacity(0.7))
                                        .padding(.top, 10)
                                } //: VSTACK
                            }
                        } //: LAZYVSTACK
                    } //: SCROLLVIEW
                    .padding(.top, 20)

                    Spacer()
                }
                .padding(.vertical, 30)
            }
        }
        .edgesIgnoringSafeArea(.vertical)
        
    }
}

// MARK: - PREVIEW
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
