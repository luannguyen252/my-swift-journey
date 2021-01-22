import SwiftUI

struct MainCardView: View {
    @Binding var weather: Weather
    
    var body: some View {
        ZStack {
            Image("card-bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
            
            VStack(spacing: 10) {
                Text("\(weather.currentTemp)°")
                    .foregroundColor(Color.white)
                    .fontWeight(Font.Weight.heavy)
                    .font(Font.system(size: 70))

                Image(systemName: weather.weatherIcon)
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                
                Text("\(weather.maxTemp)°")
                    .foregroundColor(Color.white)
                    .font(.title)
                    .padding(.vertical)
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color(weather.color))
    }
}

struct MainCardView_Previews: PreviewProvider {
    static var previews: some View {
        MainCardView(weather: .constant(Weather.sampleData[0]))
    }
}
