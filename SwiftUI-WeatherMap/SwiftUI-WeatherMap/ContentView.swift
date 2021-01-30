import SwiftUI

struct ContentView: View {
    @State var searchString: String = ""
    
    init() {
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 16) {
                SearchBar(inputText: $searchString, placeHolder: "Search by place") {
                    print($0)
                }
                .frame(height: 48, alignment: .center)

                Section(header: Text("Your location")) {
                    ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                        Color.gray
                        VStack(alignment: .leading) {
                            Text("Rainy")
                            Text("Goa, India")
                                .font(.largeTitle)

                            Text("24 C")
                                .font(.system(size: 100, weight: .bold))
                        }.padding(.horizontal)
                    }
                    .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .cornerRadius(24)
                }
                
                Section(header: Text("Favourites")) {
                    List {
                        ForEach( 0 ..< 10) { _ in
                            WeatherCardView()
                                .frame(height: 98)
                            
                        }
                        .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                        .listRowBackground(Color.clear)
                    }
                    
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

