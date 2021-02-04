import SwiftUI
import MapKit
import FloatingSegmentedControl

struct ContentView: View {
    @State var items = ["Satellite", "Standard"]
    @State var mapType: MKMapType = .hybrid
    
    var body: some View {
        ZStack {
            MapView(mapType: $mapType)
                .edgesIgnoringSafeArea(.vertical)

            VStack {
                FloatingSegmentedControlView(
                    items,
                    // title: "Map view",
                    onSelected: onSelected)
                    .padding(.top, 16)
                
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }

    func onSelected(index: Int) {
        switch index {
        case 0:
            mapType = .hybrid
        case 1:
            mapType = .standard
        default:
            mapType = .hybrid
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
