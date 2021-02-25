import SwiftUI

struct SettingsView: View {
    @State private var selection: Int = 1
    @State private var setDate = Date()
    @State private var timeZoneOverride = true
    @State private var volume: Double = 25.0
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                List {
                    // Date and Time
                    Section(header: Text("Date and Time")) {
                        DatePicker(selection: $setDate, label: {
                            Image(systemName: "calendar.circle")
                        })
                        .foregroundColor(Color("dark"))
                    }
                    .listRowBackground(Color("dark").opacity(0.15))
                    
                    // Time Zone Override
                    Section(header: Text("Time Zone Override")) {
                        Toggle(isOn: $timeZoneOverride, label: {
                            HStack {
                                Image(systemName: "timer")
                                Text("Override")
                            }
                            .foregroundColor(Color("dark"))
                        })
                    }
                    .listRowBackground(Color("dark").opacity(0.15))
                    
                    // Alarm Volume
                    Section(header: Text("Alarm Volume")) {
                        Text("Volume \(String(format: "%.0f", self.volume as Double)) Decibels")
                            .foregroundColor(Color("dark"))
                        Slider(value: $volume, in: 0...100) { _ in
                            
                        }
                    }
                    .listRowBackground(Color("dark").opacity(0.15))
                    
                    // Repeat Alarm Picker
                    Section(header: Text("Repeat Alarm Picker")) {
                        Picker(selection: $selection, label: Text("Repeat Alarm")) {
                            Text("No Repeat")
                                .tag(1)
                            Text("Repeat Once")
                                .tag(2)
                            Text("Repeat Twice")
                                .tag(3)
                        }
                        .foregroundColor(Color("dark"))
                    }
                    .listRowBackground(Color("dark").opacity(0.15))
                    
                    // Save Button
                    Button(action: {
                        withAnimation(.easeInOut(duration: 1.0)) {
                            self.show = false
                        }
                    }) {
                        HStack {
                            Spacer()
                            Text("Save")
                                .foregroundColor(Color("light"))
                            Spacer()
                        }
                    }
                    .listRowBackground(Color("dark"))
                }
                .foregroundColor(.white)
                // .listStyle(GroupedListStyle())
                .listStyle(InsetGroupedListStyle())
            }
            .frame(width: 350, height: 625)
            .cornerRadius(16)
            
            Text("Settings")
                .offset(y: -250)
                .foregroundColor(Color("dark"))
                .font(.title)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(show: .constant(false))
    }
}
