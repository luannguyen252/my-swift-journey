import SwiftUI
import ClockKit

struct AddWTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var setup = ""
    @State private var rating = "Today"
    @State private var month = "Nov"
    @State private var day = "01"
    @State private var hour = "01"
    @State private var minute = "01"
    @State private var dealine = Date().addingTimeInterval(86400)
    @State private var deadline = "06/08/98"

    let ratings = ["Today", "Someday", "Importamt"]
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    let days = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31"]
    let hours = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "00"]
    let minutes = ["01", "02", "03", "04", "05", "06", "07", "08", "09", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "00"]
    
    var body: some View {
        Form {
            Section {
                TextField("My todo", text: $setup)
            }
            
            Section {
                Picker("Rating", selection: $rating) {
                    ForEach(ratings, id: \.self) { rating in
                        Text(rating)
                    }
                }
            }
            Section{
                VStack {
                    Text("Set deadline")
                   
                    HStack {
                        Picker("Month", selection: $month) {
                            ForEach(months, id: \.self) { month in
                                Text(self.month)
                            }
                        }
                        Picker("Day", selection: $day) {
                            ForEach(days, id: \.self) { day in
                                Text(self.day)
                            }
                        }
                    }
                    .frame(height: 50)
                    Spacer()
                    HStack {
                        Picker("Hour", selection: $hour) {
                            ForEach(hours, id: \.self) { hour in
                                Text(self.hour)
                                
                            }
                        }
                        Picker("Min", selection: $minute) {
                            ForEach(minutes, id: \.self) { minute in
                                Text(self.minute)
                                
                            }
                        }
                    }
                    .frame(height: 50)
                }
                .padding()
            }
            
            Button("Add in list") {
                do {
                    self.presentationMode.wrappedValue.dismiss()
                } catch {
                    print("Whoops! \(error.localizedDescription)")
                }
            }
        }
        .navigationBarTitle("New Todo")
    }
}

struct AddWTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddWTodoView()
    }
}
