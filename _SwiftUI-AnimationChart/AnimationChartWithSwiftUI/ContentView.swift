import SwiftUI

struct ContentView: View {
    @State var pickerSelectedItem = 1
    
    // [segment][graph]
    @State var dataPoints: [[CGFloat]] = [
        [50, 100, 150, 30, 40],
        [50, 180, 70, 100, 160],
        [100, 180, 60, 80, 120],
    ]
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            Color(colorScheme == .dark ? "dark" : "light")
                .edgesIgnoringSafeArea(.all)
            VStack {
                VStack(spacing: 8) {
                    Image(uiImage: #imageLiteral(resourceName: "profile"))
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 32, height: 32, alignment: .center)
                        .cornerRadius(16)
                    Text("Luan Nguyen")
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                }
                Spacer()
                VStack {
                     Text("Animated Bar Chart")
                        .font(.system(size: 32))
                        .fontWeight(.heavy)
                        .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
                    Picker(selection: $pickerSelectedItem, label: Text("")) {
                        Text("Weekday").tag(0)
                        Text("Afternoon").tag(1)
                        Text("Evening").tag(2)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                    
                    HStack (spacing: 16) {
                        BarChart(value: dataPoints[pickerSelectedItem][0], dayTitle: "Sun")
                        BarChart(value: dataPoints[pickerSelectedItem][1], dayTitle: "Mon")
                        BarChart(value: dataPoints[pickerSelectedItem][2], dayTitle: "Tue")
                        BarChart(value: dataPoints[pickerSelectedItem][3], dayTitle: "Wed")
                        BarChart(value: dataPoints[pickerSelectedItem][4], dayTitle: "Thu")
                        BarChart(value: dataPoints[pickerSelectedItem][3], dayTitle: "Fri")
                        BarChart(value: dataPoints[pickerSelectedItem][4], dayTitle: "Sat")
                    }
                    .padding(.top, 24)
                    .animation(.default)
                }
                Spacer()
            }
        }
        .statusBar(hidden: true)
    }
}

// Bar Chart
struct BarChart: View {
    var value: CGFloat = 0
    var dayTitle: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule()
                    .frame(width: 30, height: 200)
                    .foregroundColor(colorScheme == .dark ? Color("pink").opacity(0.1) : Color("darkOrange").opacity(0.1))
                Capsule()
                    .frame(width: 30, height: value)
                    .foregroundColor(colorScheme == .dark ? Color("pink") : Color("darkOrange"))
            }
            Text(dayTitle)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .padding(.top, 8)
                .foregroundColor(colorScheme == .dark ? Color("light") : Color("dark"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
