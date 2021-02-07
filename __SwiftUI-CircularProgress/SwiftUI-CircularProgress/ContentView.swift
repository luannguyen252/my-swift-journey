import SwiftUI
import CircularProgress

struct ContentView: View {
    @State var count = 0
    let total = 10
    var progress: CGFloat{
        return CGFloat(count)/CGFloat(total)
    }
    
    var body: some View {
        VStack {
            CircularProgressView(count: count, total: total, progress: progress)
                .padding(50)
            HStack{
                Button("Decrease", action: {self.count -= 1})
                Spacer()
                Button("Increase", action: {self.count += 1})
            }
            .padding(50)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
