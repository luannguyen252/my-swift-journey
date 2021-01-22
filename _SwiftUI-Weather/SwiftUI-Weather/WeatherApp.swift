import SwiftUI

struct WeatherApp: View {
    @State private var selected = 0
    @State private var weather =  Weather(id: 1, day: "星期一", weatherIcon: "sun.max", currentTemp: "29", minTemp:"31", maxTemp: "33", color: "mainCard")
    @State private var showDetails = false
    @State private var sampleData = Weather.sampleData
    private var detailSize = CGSize(width: 0, height: UIScreen.main.bounds.height)

    var body: some View {
        VStack {
            NavBarView(country: "深圳天气")
            
            Picker("", selection: $selected){
                Text("今天").tag(0)
                Text("明天").tag(1)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

            ZStack {
                ScrollView(.vertical, showsIndicators: false) {
                    MainCardView(weather: $weather)
                        .cornerRadius(CGFloat(20))
                        .padding()
                        .shadow(color: Color(self.weather.color).opacity(0.4), radius: 20, x: 0, y: 20)
                    
                    Text("未来七天")
                        .font(.system(size: 22))
                        .fontWeight(.bold)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                        .padding(.horizontal)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(Weather.sampleData, id: \.id) { weather in
                                SmallCard(weather: weather).onTapGesture {
                                    withAnimation(.spring()) {
                                        self.showDetails.toggle()
                                        self.weather = weather
                                    }
                                }
                            }
                        }
                        .frame( height: 340)
                        .padding(.horizontal)
                    }
                    .frame( height: 350, alignment: .top)
                }
                
                DetailView(weather: self.$weather,showDetails: self.$showDetails)
                    .offset( self.showDetails ? CGSize.zero : detailSize)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherApp()
    }
}
