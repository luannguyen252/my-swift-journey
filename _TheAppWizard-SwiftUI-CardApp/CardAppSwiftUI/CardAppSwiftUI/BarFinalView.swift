import SwiftUI

struct BarFinalView: View {
    @State private var pickerSelectedItem = 0
    @State private var dataPoints: [[CGFloat]] = [
        [100, 120, 150],
        [150, 100, 120],
        [120, 150, 100],
        [120, 100, 150],
        [130, 50, 100]
    ]

    init() {
        UISegmentedControl.appearance().selectedSegmentTintColor = .white
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.purple], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColor.white], for: .normal)
    }
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                    .frame(width: 100, height: 100, alignment: .center)
                
                Text("WEEKLY STATUS")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color(.white))
                    .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                
                Picker(selection: $pickerSelectedItem, label: Text("")) {
                        Text("NETFLIX").tag(0)
                        Text("GAMES").tag(1)
                        Text("ANIME").tag(2)
                        Text("SAVINGS").tag(3)
                        
                }
                .pickerStyle(SegmentedPickerStyle())
                .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
                .padding(.horizontal, 24)
                
                HStack(spacing: 8) {
                    BarView(value: dataPoints[pickerSelectedItem][2], week: "100$").foregroundColor(Color(.white))
                    BarView(value: dataPoints[pickerSelectedItem][0], week: "150$").foregroundColor(Color(.white))
                    BarView(value: dataPoints[pickerSelectedItem][1], week: "75$").foregroundColor(Color(.white))
                    BarView(value: dataPoints[pickerSelectedItem][2], week: "100$").foregroundColor(Color(.white))
                }
                .padding(.top, 24)
                .animation(.default)
                
                Spacer()
                    .frame(width: 100, height: 100, alignment: .center)

                Text("TOTAL : 425$")
                    .font(.largeTitle)
                    .fontWeight(.regular)
                    .foregroundColor(Color.white)
                    .shadow(color: .black, radius: 1, x: 0.0, y: 0.0)
            }
        }
    }
}

struct BarFinalView_Previews: PreviewProvider {
    static var previews: some View {
        BarFinalView()
    }
}
