import SwiftUI

struct MKCloudView: View {
    private let mainCloudHeight: CGFloat = 140

    @Binding var sliderValue: Double
    let sliderMaxValue: Double

    private var paddingPercent: CGFloat {
        CGFloat(sliderValue / sliderMaxValue)
    }

    var body: some View {
        VStack(alignment: .trailing, spacing: 6) {
            HStack {
                Image.cloud
                    .aspectFit()
                    .frame(height: mainCloudHeight * 0.33)
                    .padding(.trailing, 20 + 50 * paddingPercent)
                Image.cloud
                    .aspectFit()
                    .frame(height: mainCloudHeight)
                    .padding(.trailing, 30 + 60 * paddingPercent)
            }

            Image.cloud
                .aspectFit()
                .frame(height: mainCloudHeight * 0.5)
                .padding(.trailing, 180 + 140 * paddingPercent)
        }
    }
}

struct MKCloudView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(0), sliderMaxValue: 20.0)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(4), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(8), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(12), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(16), sliderMaxValue: 20)
            }

            ZStack {
                Color.zPink
                MKCloudView(sliderValue: .constant(20), sliderMaxValue: 20)
            }
        }
        .previewLayout(.fixed(width: 800, height: 600))
    }
}
