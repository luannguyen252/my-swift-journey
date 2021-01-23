import SwiftUI
import MapKit

struct ControlsView : View {
    @Binding var units: WeatherAPI.Units
    
    var body: some View {
        HStack {
            Text("Units:")
            Spacer()
            Picker(selection: $units, label: Text("Units:")) {
                Text("Imperial").tag(WeatherAPI.Units.imperial)
                Text("Metric").tag(WeatherAPI.Units.metric)
            }
            .pickerStyle(SegmentedPickerStyle())
        }
        .padding(.leading).padding(.trailing)
    }
}

#if DEBUG
struct ControlsView_Previews : PreviewProvider {
    static var previews: some View {
        ControlsView(units: .constant(.imperial))
            .previewLayout(.sizeThatFits)
    }
}
#endif
