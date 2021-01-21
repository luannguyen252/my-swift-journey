import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            
            SearchView(text: .constant(""))
                .shadow(color: Color.gray.opacity(0.2), radius: 8, x:0, y:10)
                .padding(.horizontal, 20)
                .padding(.top, 20)
            
            ForEach(category) { i in
                VStack(spacing: 10){
                    HStack {
                        Text(i.title)
                            .font(.custom("Helvetica Neue", size: i.size))
                            .fontWeight(.bold)
                        
                        Spacer()
                    }
                    
                    LocationView(row: i.gridItem, cardHeight: i.cardHeight)
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
            }
            VStack(spacing: 10) {
                HStack {
                    Text("Explore")
                        .font(.custom("Helvetica Neue", size: 22))
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                ExploreView()
            }
            .padding(.horizontal,20)
            .padding(.top, 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
 
struct Category: Identifiable {
    var id = UUID()
    var title: String
    var size: CGFloat
    var gridItem: [GridItem]
    var cardHeight: CGFloat
}

var category = [
    Category(title: "popular", size: 30, gridItem: Array(repeating: GridItem(.fixed(230), spacing: 10), count: 1), cardHeight: 210),
    Category(title: "Discover", size: 22, gridItem: Array(repeating: GridItem(.fixed(125), spacing: 10), count: 1), cardHeight: 105),
]
