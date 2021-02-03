//
//  SearchView.swift
//  Neu Music Player
//
//  Created by Spencer Curtis on 4/2/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI

protocol SearchResult {
    var mainText: String { get }
    var subText: String? { get }
    var id: UUID { get }
}

struct Artist: SearchResult {
    var name: String
    var id = UUID()
    
    var mainText: String {
        return name
    }
    
    var subText: String? {
        return name
    }
}

struct SearchView: View {
    
    var searchResults: [SearchResult] = [
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles"),
        Artist(name: "Weezer"),
        Artist(name: "The Beatles")
    ]
    
    @State var selectedResult: SearchResult?
    
    init() {
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().showsVerticalScrollIndicator = false
        UITableViewCell.appearance().backgroundColor = .clear
        
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                Gradient(colors: [.bgGradientTop, .bgGradientBottom]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            List(searchResults, id: \.id) { (searchResult) in
                
                SearchResultRow(searchResult: searchResult, selectedResult: self.$selectedResult)
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}


struct SearchRowStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 14)
                .fill(fillForBackground(for: configuration.isPressed))
                .shadow(color: Color.white.opacity(0.1), radius: 1, x: 0, y: -1)
                .shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 1)
            
            configuration.label
        }
    }
    
    func fillForBackground(for isPressed: Bool) -> some ShapeStyle {
        if isPressed {
            return LinearGradient(gradient:
                Gradient(colors: [Color.bgGradientMedium, .bgGradientBottom]),
                                  startPoint: .bottom,
                                  endPoint: .top)
        } else {
            return LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.0001)]),
                                  startPoint: .bottom,
                                  endPoint: .top)
        }
    }
}

struct SearchResultRow: View {
    
    var searchResult: SearchResult
    
    @Binding var selectedResult: SearchResult?
    
    var body: some View {
        Button(action: {
            self.selectedResult = self.searchResult
        }) {
            ZStack {
                
                if searchResult.id == selectedResult?.id {
                    RoundedRectangle(cornerRadius: 14)
                        .fill(
                            LinearGradient(gradient:
                                Gradient(colors: [Color.bgGradientMedium, .bgGradientBottom]),
                                           startPoint: .bottom,
                                           endPoint: .top)
                    )
                    .shadow(color: Color.white.opacity(0.1), radius: 1, x: 0, y: -1)
                    .shadow(color: Color.black.opacity(0.4), radius: 1, x: 0, y: 1)
                }
                HStack {
                    VStack(alignment: .leading) {
                        Text(searchResult.mainText)
                            .foregroundColor(.buttonColor)
                            .font(Font.system(.headline).weight(.medium))
                        
                        if (searchResult.subText != nil) {
                            Text(searchResult.subText!)
                                .foregroundColor(.buttonColor)
                                .font(Font.system(.caption))
                        }
                    }
                    .padding(.leading)
                    
                    Spacer()
                    
                    BasicButton(imageName: "play.fill", size: 40, symbolConfig: .searchButtonConfig)
                        .padding(.trailing)
                }
            }
        }
        .buttonStyle(SearchRowStyle())
        .frame(height: 60)
    }
}
