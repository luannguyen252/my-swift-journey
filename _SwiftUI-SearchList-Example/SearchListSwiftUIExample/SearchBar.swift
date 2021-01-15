//
//  SearchBar.swift
//  SearchListSwiftUIExample
//
//  Created by John Codeos on 11/18/20.
//

import SwiftUI

struct SearchBar: View {
    @State private var searchInput: String = ""

    @Binding var searching: Bool
    @Binding var mainList: [String]
    @Binding var searchedList: [String]

    var body: some View {
        ZStack {
            // Background Color
            Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
            // Custom Search Bar (Search Bar + 'Cancel' Button)
            HStack {
                // Search Bar
                HStack {
                    // Magnifying Glass Icon
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1)))

                    // Search Area TextField
                    TextField("", text: $searchInput)
                        .onChange(of: searchInput, perform: { searchText in
                            searching = true
                            searchedList = mainList.filter { $0.lowercased().prefix(searchText.count) == searchText.lowercased() || $0.contains(searchText) }

                        })
                        .accentColor(.white)
                        .foregroundColor(.white)
                }
                .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)).cornerRadius(8.0))

                // 'Cancel' Button
                Button(action: {
                    searching = false
                    searchInput = ""

                    // Hide Keyboard
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }, label: {
                    Text("Cancel")
                })
                    .accentColor(Color.white)
                    .padding(EdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 8))
            }
            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        }
        .frame(height: 50)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searching: .constant(true), mainList: .constant(["Lorem ipsum", "Lorem ipsum", "Lorem ipsum"]), searchedList: .constant(["Lorem ipsum", "Lorem ipsum", "Lorem ipsum"]))
    }
}
