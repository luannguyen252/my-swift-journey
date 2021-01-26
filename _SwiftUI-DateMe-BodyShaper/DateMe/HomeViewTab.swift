
import SwiftUI

struct HomeViewTab: View {
    
    @State var photos: [Photos] = []
    
    var body: some View {
        NavigationView {
            
        
        ScrollView(showsIndicators: false) {
            HorizontalView(type: "shoulders")
            HorizontalView(type: "legs")
            HorizontalView(type: "shoulders")
            HorizontalView(type: "legs")
            HorizontalView(type: "shoulders")
            }
        .navigationBarTitle("Exercises", displayMode: .automatic)
            }
    }
}



// The Vertical view in Home
// Image - Url
// Title - String
// Subheadline - String

struct VCard: View {
    let type: String
    var body: some View {
        VStack {
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack {
                   ForEach(1...8, id: \.self) { n in
                    NavigationLink(destination: ExerciseView()){
                    VStack(alignment:.leading) {
                    Image("\(self.type)\(n)").resizable()
                        .cornerRadius(4)
                        
                        Text("\(self.type)\(n)")
                       .font(.footnote)
                       .fontWeight(.semibold)
                        Text("\(self.type)\(n)")
                       .font(.footnote)
                       .fontWeight(.light)
                   }.frame(minWidth: 200, idealWidth: 200, maxWidth: 250, minHeight: 200, idealHeight: 200, maxHeight: 250)
                        
                     }.buttonStyle(PlainButtonStyle())
                    }
                }.padding(.leading)
            }
        }
    }
}



struct HorizontalView: View {
    let type: String
    var body: some View {
        VStack {
            HStack {
                Text(type)
                    .fontWeight(.bold)
                    .font(.headline)
                Spacer()
                NavigationLink(destination: SeeAllGrid()) {
                    Text("See All")
                }
            }.padding(.horizontal)
            HStack {
                VCard(type: type)
            }
        }
    }
}

struct HomeViewTab_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewTab()
    }
}
