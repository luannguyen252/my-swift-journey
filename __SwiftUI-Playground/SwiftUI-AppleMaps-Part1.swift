import SwiftUI
import MapKit
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        ZStack {
            MapView()
            
            VStack {
                HStack {
                    Spacer()
                    Controls()
                }
                
                Spacer()
                Sheet()
            }
        }
        .cornerRadius(24)
    }
}

struct Sheet: View {
    @State var search = ""
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 5)
            .frame(width: 32, height: 5)
            .foregroundColor(Color(UIColor.tertiaryLabel))
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search for a place or address", text: $search)
                    .foregroundColor(.primary)
                Image(systemName: "mic.fill")
            }
            .foregroundColor(Color(UIColor.tertiaryLabel))
            .padding(12)
            .background(Color(UIColor.tertiarySystemGroupedBackground))
            .cornerRadius(12)
        }
        .padding(24)
        .padding(.top, -16)
        .background(Color(UIColor.secondarySystemGroupedBackground))
        .cornerRadius(12)
    }
}

struct Controls: View {
    var body: some View {
        VStack(spacing: 6) {
            VStack(spacing: 12) {
                Image(systemName: "info.circle")
                Divider()
                Image(systemName: "location.fill")
            }
            .frame(width: 40)
            .padding(.vertical, 12)
            .background(Color(UIColor.secondarySystemGroupedBackground))
            .cornerRadius(8)
            
            Image(systemName: "binoculars.fill")
                .frame(width: 40)
                .padding(.vertical, 12)
                .background(Color(UIColor.secondarySystemGroupedBackground))
                .cornerRadius(8)
        }
        .font(.system(size: 20))
        .foregroundColor(.blue)
        .padding()
        .shadow(color: Color(UIColor.black.withAlphaComponent(0.1)), radius: 4)
    }
}

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        // do nothing
    }
}

PlaygroundPage.current.setLiveView(ContentView())
