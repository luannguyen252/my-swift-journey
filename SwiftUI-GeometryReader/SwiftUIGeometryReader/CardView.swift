import SwiftUI

struct CardView: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Image("logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: geometry.size.width, height: geometry.size.height / 4)
                        .background(Color.pink)
                        .border(Color.black)
                    
                    Text("rebeloper.com")
                        .fontWeight(.heavy)
                        .frame(width: geometry.size.width, height: geometry.size.height / 2)
                        .background(Color.orange)
                        .border(Color.black)
                    
                    Text("Layout with Geometry Reader")
                        .fontWeight(.heavy)
                        .frame(width: geometry.size.width, height: geometry.size.height / 4)
                        .background(Color.blue)
                        .border(Color.black)
                }
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.yellow)
        .border(Color.red)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
