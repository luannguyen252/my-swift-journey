import SwiftUI

@main
struct Filter_SliderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(values: [0,0,1,2,3,4,7,4,5,6,10,5,3,2,1,0,0,1,2,1,0,0], activeColor: Color(red: 124/255, green: 73/255, blue: 249/255))
                .frame(width: nil, height: 100, alignment: .center)
                .padding(.horizontal, 25)
        }
    }
}
