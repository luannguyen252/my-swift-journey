import SwiftUI

struct ContentView: View {
    var data = [percents(id: 1, per: 40),percents(id: 2, per: 80),percents(id: 3, per: 90),percents(id: 4, per: 25),percents(id: 5, per: 100)]
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            ForEach(data) { i in
                Bar(percentage: i.per)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Bar: View {
    @State var percentage: CGFloat
    
    var body: some View{
        VStack{
            Text("\(percentage)%")
            Rectangle().fill(Color.red).frame(width: 50,height: percentage)
            Text("\(percentage)")
        }
    }
}

struct percents: Identifiable{
    var id: Int
    var per: CGFloat
}
