// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import SwiftUI

/// see https://stackoverflow.com/questions/61923913/modal-picker-not-scrolling-right-swiftui
struct ModalPickerView: View {

    @State var showingModal = false
    @State var hours: Int = 0
    @State var minutes: Int = 0

    var body: some View {

        ZStack {
            VStack {
                Button("Show me") {
                    self.showingModal = true
                }

                if showingModal {
                    VStack(alignment: .center) {
                        ZStack {
                            Color.black.opacity(0.4)
                                .edgesIgnoringSafeArea(.vertical)

                            VStack(spacing: 20) {
                                Text("Time between meals")
                                    .bold().padding()
                                    .frame(maxWidth: .infinity)
                                    .background(Color.yellow)
                                    .foregroundColor(Color.white)

                                HStack {
                                    Picker("", selection: $hours) {
                                        ForEach(0 ..< 4, id: \.self) { i in
                                            Text("\(i) hours").tag(i)
                                        }
                                    }
                                    .frame(width: 150, height: 120)
                                    .clipped()

                                    Picker("", selection: $minutes) {
                                        ForEach(0 ..< 60, id: \.self) { i in
                                            Text("\(i) min").tag(i)
                                        }
                                    }
                                    .frame(width: 150, height: 120)
                                    .clipped()
                                }

                                Spacer()

                                Button(action: {
                                    self.showingModal = false
                                }) {
                                    Text("Close")
                                }.padding()
                            }
                            .frame(width: 300, height: 300)
                            .background(Color.white)
                            .mask(RoundedRectangle(cornerRadius: 20))
                            .shadow(radius: 20)
                        }
                    }
                }
            }
        }
    }
}

struct ModalPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ModalPickerView()
    }
}
