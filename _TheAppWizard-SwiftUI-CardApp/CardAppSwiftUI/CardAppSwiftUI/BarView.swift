import SwiftUI

struct BarView: View {
    var value: CGFloat = 0
    var week: String = ""
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 20, height: value)
                    .overlay( Capsule().stroke(Color.white, lineWidth: 2))
                    .foregroundColor(.clear)
                
                Capsule().frame(width: 20, height: value)
                    .overlay( Capsule().stroke(Color.white, lineWidth: 2))
                    .foregroundColor(.clear)
                
                Capsule().frame(width: 20, height: value)
                    .overlay( Capsule().stroke(Color.white, lineWidth: 2))
                    .foregroundColor(.clear)
                
                Capsule().frame(width: 20, height: value)
                    .overlay( Capsule().stroke(Color.white, lineWidth: 2))
                    .foregroundColor(.clear)
                
                Capsule().frame(width: 20, height: value)
                    .overlay( Capsule().stroke(Color.white, lineWidth: 2))
                    .foregroundColor(.clear)
            }
            .padding()
            Text(week)
        }
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView()
    }
}
