import SwiftUI

struct WeatherCardView: View {
    var image: String = ""
    var locationName: String = "Panjim"
    var country: String = "India"
    
    var body: some View {
        ZStack {
            HStack {
                VStack(alignment: .leading) {
                    Spacer()
                    Text(locationName.uppercased())
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .bold, design: .rounded))
                    Text(country)
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .thin, design: .rounded))
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
                Spacer()
                
                VStack {
                    Spacer()
                    Text("5")
                        .foregroundColor(.white)
                        .font(.system(size: 50, weight: .bold, design: .rounded))
                }
                .padding(.horizontal)
                .padding(.bottom, 4)
            }
        }
        .background(
            Illustrations.weatherCellBackgrounds.randomElement()!
                .resizable()
                .scaledToFill()
                .clipped()
                .overlay(Color.black.opacity(0.20))
        )
        .cornerRadius(12)
    }
}

struct WeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherCardView()
            .previewLayout(.fixed(width: 400, height: 94))
    }
}
