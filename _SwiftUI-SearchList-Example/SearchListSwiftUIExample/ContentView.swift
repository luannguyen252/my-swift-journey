//
//  ContentView.swift
//  SearchListSwiftUIExample
//
//  Created by John Codeos on 11/18/20.
//

import SwiftUI

struct ContentView: View {
    init() {
        // Navigation Bar Background Color
        UINavigationBar.appearance().barTintColor = UIColor(#colorLiteral(red: 0.737254902, green: 0.1294117647, blue: 0.2941176471, alpha: 1))
        // Navigation Bar Text Color
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        // Navigation Bar Back Button Color
        UINavigationBar.appearance().tintColor = UIColor.white

        UINavigationBar.appearance().isTranslucent = false
    }

    @State private var countryList = [String]()
    @State private var searchedCountryList = [String]()
    @State private var searching = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // SearchBar
                SearchBar(searching: $searching, mainList: $countryList, searchedList: $searchedCountryList)

                // List
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(searching ? (0..<searchedCountryList.count) : (0..<countryList.count), id: \.self) { row in
                            NavigationLink(
                                destination:
                                DetailsView(selectedCountry: searching ? searchedCountryList[row] : countryList[row]),

                                label: {
                                    ListCell(text: searching ? searchedCountryList[row] : countryList[row])
                                        .frame(height: 44)

                                })
                                .simultaneousGesture(TapGesture().onEnded {
                                    // Hide Keyboard after pressing a Cell
                                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                })
                                .buttonStyle(ListButtonStyle(highlightColor: Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)).opacity(0.7))) // Highlight Color
                                .navigationTitle("SearchListSwiftUIExample") // Title for the back button
                        }
                    }
                }
                .background(Color(#colorLiteral(red: 0.6196078431, green: 0.1098039216, blue: 0.2509803922, alpha: 1)).ignoresSafeArea())
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("SearchListSwiftUIExample") // Navigation Bar Title
        }
        .onAppear(perform: {
            listOfCountries()
        })
    }

    func listOfCountries() {
        for code in NSLocale.isoCountryCodes as [String] {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countryList.append(name + " " + countryFlag(country: code))
        }
    }

    // Add Flag Emoji
    func countryFlag(country: String) -> String {
        let base: UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Highlight Color for Cell
struct ListButtonStyle: ButtonStyle {
    var highlightColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.overlay(configuration.isPressed ? highlightColor : Color.clear)
    }
}
