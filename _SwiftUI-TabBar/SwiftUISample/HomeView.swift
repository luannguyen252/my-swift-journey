import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}

struct HomeView: View {
    let modelData: [Weather] =
        [Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
         Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
         Weather(image: "sun.max", temp: 25, city: "Paris"),
         Weather(image: "cloud.sun", temp: 23, city: "Tokyo"),
         Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
         Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
         Weather(image: "sun.max", temp: 25, city: "Paris"),
         Weather(image: "cloud.sun", temp: 23, city: "Tokyo"),
         Weather(image: "cloud.rain", temp: 21, city: "Amsterdam"),
         Weather(image: "cloud.sun.rain", temp: 18, city: "London"),
         Weather(image: "sun.max", temp: 25, city: "Paris"),
         Weather(image: "cloud.sun", temp: 23, city: "Tokyo")]

    var body: some View {
        NavigationView() {
            List(modelData) { weather in
                NavigationLink(destination: Text(weather.city).font(.largeTitle)) {
                    WeatherCell(weather: weather)
                }
            }
            .navigationBarTitle(Text("Home"))
        }
    }
}

struct WeatherCell: View {
    let weather: Weather
    init(weather: Weather) {
        self.weather = weather
    }
    
    var body: some View {
        HStack {
            Image(systemName: weather.image)
                .frame(width: 50, height: 10, alignment: .leading)
            VStack(alignment: .leading) {
                Text(weather.city)
                    .font(.headline)
                    .foregroundColor(.pink)
                Text("Temp: \(weather.temp)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
        .font(.title)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
