// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

enum Weather: CaseIterable {
    case sunny
    case cloudy
    case rainy
}

extension Weather {

    var image: Image {
        switch self {

        case .sunny:
            return Image(systemName: "sun.max")
        case .cloudy:
            return Image(systemName: "cloud")
        case .rainy:
            return Image(systemName: "cloud.rain")
        }
    }

}

struct PickerExampleView: View {

    @State var selection = Weather.sunny

    var body: some View {
        Section {
            self.examplePicker
        }

        Section {
            self.examplePicker
                .pickerStyle(SegmentedPickerStyle())
        }
        .padding()
    }

    var examplePicker: some View {
        Picker(
            selection: $selection,
            label: Text("Weather"),
            content: {
                ForEach(Weather.allCases, id: \.self) { weather in
                    weather.image.tag(weather)
                }
            }
        )
    }

}

struct PickerExampleView_Previews: PreviewProvider {
    static var previews: some View {
        PickerExampleView()
    }
}
