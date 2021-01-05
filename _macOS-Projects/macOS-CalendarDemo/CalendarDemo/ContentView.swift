

import SwiftUI


struct ContentView: View {
    
    private let calendar = Calendar.current
    private let dateFormatter = DateFormatter()
    
    @State private var selectedYear: Int = 2020
    @State private var selectedMonth: Int = 11
    
    @State private var numbersOfDays: Int = 0
    @State private var firstWeekday: Int = 0
    @State private var nameOfMonth: String = "–"
    
    var body: some View {
        
        VStack {
            
            // Picker
            HStack {
                
                Picker(selection: $selectedYear, label: Text("Year"), content: {
                    Text("2020").tag(2020)
                    Text("2021").tag(2021)
                    Text("2022").tag(2022)
                })
                .onChange(of: selectedYear, perform: {
                    value in
                    self.update()
                })
                
                Picker(selection: $selectedMonth, label: Text("Month"), content: {
                    ForEach(0..<12) {
                        index in
                        Text("\(index+1)").tag(index)
                    }
                })
                .onChange(of: selectedMonth, perform: {
                    value in
                    self.update()
                })
                
            }
            .pickerStyle(MenuPickerStyle())
            .padding()
            
            // Data
            Text("\(self.nameOfMonth)").font(Font.title.weight(.medium))
            Text("has \(self.numbersOfDays) days")
            Text("starts on day \(self.firstWeekday)")
            
            // Grid
            VStack {
                ForEach(1..<7) {
                    row in
                    HStack {
                        ForEach(1..<8) {
                            column in
                            
                            let previousDaysElapsed = 7 * (row - 1)
                            let currentDay = column + previousDaysElapsed
                            
                            let dayIsInRange = (currentDay > self.firstWeekday) && currentDay <= (self.numbersOfDays + self.firstWeekday)
                            
                            ZStack {
                                Circle().foregroundColor(dayIsInRange ? .white : .gray)
                                Text(dayIsInRange ? "\(currentDay - self.firstWeekday)" : "")
                            }
                            
                        }
                    }
                }
            }
            .padding()
            
        }
        .frame(width: 400, height: 400)
        .onAppear {
            self.update()
        }
       
        
    }
    
    
    private func update() {
        
        let dateComponents = DateComponents(year: self.selectedYear, month: self.selectedMonth + 1, day: 1)
        guard let selectedDate = calendar.date(from: dateComponents) else { return }
        
        // Number of Days
        let range = calendar.range(of: .day, in: .month, for: selectedDate)!
        self.numbersOfDays = range.count
        
        // First Weekday
        self.firstWeekday = calendar.component(.weekday, from: selectedDate) // 1 == sunday
        
        // Name of Month
        dateFormatter.dateStyle = .full
        dateFormatter.dateFormat = "MMMM"
        nameOfMonth = dateFormatter.string(from: selectedDate)
        
    }
    
    
    
}


// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
