import SwiftUI

struct TransportView: View {
    @State var selectedTransport = Transport.car

    var body: some View {
        ZStack {
            Form {
                // 1. Picker
                Section(header: Text("Picker")
                            .font(.custom("Chivo-Bold", size: 14))
                            .foregroundColor(Color("dark"))
                ) {
                    Picker("Transport", selection: $selectedTransport) {
                        ForEach(Transport.allCases, id: \.self) { transport in
                            Text(transport.localizedTitle).tag(transport)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                // 2. List
                Section(header: Text("List")
                            .font(.custom("Chivo-Bold", size: 14))
                            .foregroundColor(Color("dark"))
                ) {
                    List(Transport.allCases, id: \.self) { transport in
                        HStack {
                            Button(transport.localizedTitle) {
                                self.selectedTransport = transport
                            }
                            Spacer()
                            if transport == self.selectedTransport {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color("pink2"))
                            }
                        }
                    }
                }

                // 3. Menu
                Section(header: Text("Menu")
                            .font(.custom("Chivo-Bold", size: 14))
                            .foregroundColor(Color("dark"))
                ) {
                    Menu(
                        content: {
                            ForEach(Transport.allCases, id: \.self) { transport in
                                Button(transport.localizedTitle) {
                                    self.selectedTransport = transport
                                }
                            }
                        },
                        label: {
                            HStack {
                                Text(self.selectedTransport.localizedTitle)
                                Spacer()
                            }
                        }
                    )
                    .accentColor(Color(UIColor.label))
                }
            }
        }
        .statusBar(hidden: true)
    }
}

#if DEBUG
struct TransportView_Previews: PreviewProvider {
    static var previews: some View {
        TransportView()
            .preferredColorScheme(.dark)
    }
}
#endif
