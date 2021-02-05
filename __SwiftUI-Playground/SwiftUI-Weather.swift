import SwiftUI
import PlaygroundSupport

// New York
let latitude = 40.709335
let longitude = -73.956558

// San Francisco
//  let latitude = 37.7749
//  let longitude = -122.4194

// Weather API
let apiURL = "https://api.lil.software/weather"

struct Weather: Codable {
    var forecast: [Day]
}

struct Day: Codable, Hashable {
    var name: String
    var temperature: Int
    var description: String
}

struct ForecastView: View {
    @State var forecast: [Day] = []
    @State var loading = true
    
    var body: some View {
        VStack {
            if self.loading {
                Text("Loading...")
            } else {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 28) {
                        ForEach(forecast, id: \.self) { day in
                            DayView(day: day)
                        }
                    }
                    .padding()
                }
            }
        }
        .onAppear(perform: {
            self.loadForecast()
        })
    }
    
    func loadForecast() {
        // Create the API url (ex: https://api.lil.software/weather?latitude=40.709335&longitude=-73.956558)
        let request = URLRequest(url: URL(string: "\(apiURL)?latitude=\(latitude)&longitude=\(longitude)")!)
        
        // Initiate the API request
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                // Decode the response into our Weather struct
                if let decodedResponse = try? JSONDecoder().decode(Weather.self, from: data) {
                    DispatchQueue.main.async {
                        // Set the forecast based on the API response
                        self.forecast = decodedResponse.forecast
                        // We're no longer "loading"
                        self.loading = false
                    }
                    
                    return
                }
            }
        }.resume()
    }
}

struct DayView: View {
    @State var day: Day
    
    var body: some View {
        VStack(spacing: 0) {
            Text(day.name)
                .font(.subheadline)
                .lineLimit(1)
                .foregroundColor(Color(UIColor.secondaryLabel))

            Spacer()
            Icon(day: day)
            Spacer()
            
            Text("\(day.temperature)°")
                .font(.title)
        }
        .padding(.vertical, 28)
        .padding(.horizontal)
        .frame(width: 192, height: 212)
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(24)
    }
}

struct Icon: View {
    @State var day: Day
    @State var imageName = "sun.max.fill" // ☀️ Sunny by default
    @State var color = Color(UIColor.systemOrange)
    
    var body: some View {
        Image(systemName: imageName)
            .font(.system(size: 48, weight: .medium))
            .frame(width: 48)
            .foregroundColor(color)
            .onAppear(perform: {
                self.setIcon()
            })
    }
    
    func setIcon() {
        // Sets the icon of the day based on the weather description
        let forecastDescription = self.day.description.lowercased()
        
        if self.day.name.lowercased().contains("night") {
            // 🌙 If name contains "night"
            self.imageName = "moon.fill"
            color = Color(UIColor.systemGray)
        } else if forecastDescription.contains("showers") || forecastDescription.contains("rain") {
            // 🌧 If description contains "showers" or "rain"
            self.imageName = "cloud.rain.fill"
            color = Color(UIColor.systemTeal)
        }
    }
}

PlaygroundPage.current.setLiveView(ForecastView())
