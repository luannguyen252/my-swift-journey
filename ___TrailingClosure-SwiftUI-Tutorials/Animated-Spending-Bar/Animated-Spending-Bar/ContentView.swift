import SwiftUI

struct ContentView: View {
    @State var values   :   [Double]    =   [500, 320]
    var colors          :   [Color]     =   [Color.green, Color.red]
    var isVertical                      =   false
    
    // Total of all Value data Combined
    var totalValue:Double {
        get {
            values.reduce(0) { (res, val) -> Double in
                return res + val
            }
        }
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            Text("Spending")
                .font(Font.system(size: 22, weight: .bold, design: .rounded))
                .padding(.top, 20)

            VStack(alignment: .center, spacing: 12) {
                HStack(alignment: .center, spacing: 20) {
                    Text("Total")
                        .font(Font.system(size: 22, weight: .bold, design: .rounded))
                    
                    Spacer()
                    
                    VStack {
                        Text("Spent")
                            .font(Font.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(Color.gray)
                        HStack(alignment: .center, spacing: 0) {
                            Text("-")
                                .font(Font.system(size: 14, weight: .medium, design: .default))
                                .foregroundColor(Color.red)
                            Text("$\(Int(values[1]))")
                                .font(Font.system(size: 14, weight: .bold, design: .rounded))
                                .animation(.none)
                        }
                    }
                    
                    VStack {
                        Text("Income")
                            .font(Font.system(size: 14, weight: .medium, design: .default))
                            .foregroundColor(Color.gray)
                        HStack(alignment: .center, spacing: 0) {
                            Text("+")
                                .font(Font.system(size: 14, weight: .medium, design: .default))
                                .foregroundColor(Color.green)
                            Text("$\(Int(totalValue))")
                                .font(Font.system(size: 14, weight: .bold, design: .rounded))
                                .animation(.none)
                        }
                    }
                }
                
                /* -------------------------------
                    MARK: SegmentedBar
                   -------------------------------
                */
                SegmentedBar(values: $values, colors: colors, isVertical: isVertical)
                    .frame(width: nil, height: 6, alignment: .center)
            }
            .padding(18)
            .background(Color.white)
            .cornerRadius(10)
            .padding()
            .shadow(color: Color.gray.opacity(0.5), radius: 50, x: 0, y: 2)

            // MARK: Spending Buttons
            // Buttons To Spend/Unspend Money
            HStack(alignment: .center, spacing: 20) {
                Button(action: {
                    withAnimation {
                        self.values[0] += 150
                        self.values[1] -= 150
                    }
                }) {
                    Text("$")
                        .font(Font.system(size: 20, weight: Font.Weight.bold, design: .default))
                        .foregroundColor(Color.green)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.5), radius: 25, x: 0, y: 2)
                }
                Button(action: {
                    withAnimation {
                        self.values[0] -= 150
                        self.values[1] += 150
                    }
                }) {
                    Text("$")
                        .font(Font.system(size: 20, weight: Font.Weight.bold, design: .default))
                        .foregroundColor(Color.red)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 8)
                        .background(Color.white)
                        .cornerRadius(5)
                        .shadow(color: Color.gray.opacity(0.5), radius: 25, x: 0, y: 2)
                }
            }
            Spacer()
        }
    }
}

// Segmented Bar
struct SegmentedBar: View {
    @Binding var values     :   [Double]
    @State var colors       :   [Color]
    @State var isVertical   :   Bool
    
    private var totalValue: Double {
        get {
            return values.reduce(0) { (res, val) -> Double in
                return res + val
            }
        }
    }
        
    var body: some View {
        GeometryReader { geometry in
            if self.isVertical { // Vertical Stack
                VStack(alignment: .center, spacing: 4) {
                    ForEach(self.values.indices) { i in
                        Rectangle()
                            .frame(width: nil, height: geometry.size.height * CGFloat(self.values[i] / self.totalValue), alignment: .center)
                            .foregroundColor(self.colors[i])
                            .cornerRadius(geometry.size.width/2.0)
                            .animation(.easeInOut)
                    }
                }
            } else { // Horizontal Stack
                HStack(alignment: .center, spacing: 4.0) {
                    ForEach(self.values.indices) { i in
                        Rectangle()
                            .frame(width: geometry.size.width * CGFloat(self.values[i] / self.totalValue), height: nil, alignment: .center)
                            .foregroundColor(self.colors[i])
                            .cornerRadius(geometry.size.height/2.0)
                            .animation(.easeInOut)
                    }
                }
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
