import SwiftUI

struct DetailView: View {
    @Binding var weather: Weather
    @Binding var showDetails: Bool
    
    var body: some View {
        GeometryReader { gr in
            ZStack {
                VStack(spacing: 20) {
                    // Day tText
                    Text(self.weather.day).fontWeight(.bold)
                        .font(.system(size: 60))
                        .frame(height: gr.size.height * 1/10)
                        .minimumScaleFactor(0.5)
                        .foregroundColor(Color.white)
                    
                    // Weather Image
                    Image(systemName: self.weather.weatherIcon)
                        .resizable()
                        .foregroundColor(Color.white)
                        .frame(width: gr.size.height * 3 / 10, height: gr.size.height * 3 / 10)
                    
                    // Degrees Texts
                    VStack {
                        VStack(spacing: 20) {
                            Text("\(self.weather.currentTemp)°")
                                .font(.system(size: 50))
                                .foregroundColor(Color.white)
                                .fontWeight(.bold)
                                .frame(height: gr.size.height * 0.7/10)
                                .minimumScaleFactor(0.5)
                            
                            HStack(spacing: 40) {
                                Text("\(self.weather.minTemp)°")
                                    .foregroundColor(Color("light-text"))
                                    .font(.title)
                                    .minimumScaleFactor(0.5)
                                
                                Text("\(self.weather.maxTemp)°")
                                    .foregroundColor(Color.white)
                                    .font(.title)
                                    .minimumScaleFactor(0.5)
                            }
                        }
                    }
                    
                    // Hourly Views
                    HStack (spacing: 20){
                        HourView()
                        HourView(hour: "15:00", icon: "sun.dust.fill", color: "tuesday")
                        HourView(hour: "16:00",icon: "cloud.rain.fill", color: "thursday")
                        HourView(hour: "17:00",icon: "cloud.bolt.fill", color: "sunday")
                        HourView(hour: "18:00",icon: "snow", color: "mainCard")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: gr.size.height * 2 / 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .cornerRadius(30)
                    .padding()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: gr.size.height, alignment: .bottom)
                .background(Color(self.weather.color))
                .clipShape(CustomShape(), style: FillStyle.init(eoFill: true, antialiased: true))
                
                // Close icon
                HStack {
                    Image(systemName: "xmark")
                        .resizable()
                        .foregroundColor(Color.red)
                        .frame(width: 20, height: 20)
                    
                }
                .padding(20)
                .background(Color.white)
                .cornerRadius(100)
                .offset(x: 0, y: -gr.size.height / 2)
                .shadow(radius: 20)
                .onTapGesture {
                    withAnimation(.spring()) { self.showDetails.toggle() }
                }
            }
        }
    }
}

struct CustomShape: Shape {
    func path(in rect: CGRect) -> Path {
        let cornerRadius:CGFloat = 40
        var path = Path()
        
        path.move(to:  CGPoint(x: 0, y: cornerRadius))
        path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0), control: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.width - cornerRadius, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.width, y: cornerRadius), control: CGPoint(x: rect.width , y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.closeSubpath()

        return path
    }
}

struct HourView: View {
    var hour = "14:00"
    var icon = "sun.max.fill"
    var color = "wednesday"
    
    var body: some View {
        GeometryReader { gr in
            VStack {
                Text(self.hour).foregroundColor(Color("text"))
                Image(systemName: self.icon)
                    .resizable()
                    .foregroundColor(Color(self.color))
                    .frame(width: gr.size.height * 1/3, height: gr.size.height * 1/3)
                Text("24°")
                    .font(.system(size: 24))
                    .foregroundColor(Color("text"))
                    .fontWeight(.semibold)
            }
        }
        .padding(.vertical, 30)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(weather: .constant(Weather(id: 1, day: "星期一", weatherIcon:  "sun.max", currentTemp:  "24", minTemp: "25", maxTemp: "29", color: "mainCard")), showDetails: .constant(false))
    }
}
