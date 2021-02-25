import SwiftUI

struct InfoView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack{
            LogoView()
            Spacer()
            Form {
                Section(header: Text("About Us")) {
                    FormRowView(firstItem: "Application", secondItem: "Slot Machine")
                    FormRowView(firstItem: "Platforms", secondItem: "iPhone, iPad, mac")
                    FormRowView(firstItem: "Developer", secondItem: "Luan Nguyen")
                    FormRowView(firstItem: "Designer", secondItem: "Freelance")
                    FormRowView(firstItem: "Music", secondItem: "Game Audio")
                    FormRowView(firstItem: "Website", secondItem: "luannguyen.design")
                    FormRowView(firstItem: "Copyrights", secondItem: "@2021 All Rights Reserved")
                    FormRowView(firstItem: "Version", secondItem: "1.0.0")
                }
            }
            .font(.system(.body, design: .rounded))
        }
        .padding(.top, 40)
        .overlay(
            Button(action: {
                audioPlayer?.stop()
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark.circle")
                    .font(.title)
            }
            .padding()
            .accentColor(.secondary)
            ,alignment: .topTrailing
        )
        .onAppear(perform: {
            playSound(sound: "background-music", ofType: "mp3")
        })
    }
}

struct FormRowView: View {
    let firstItem: String
    let secondItem: String
    
    var body: some View {
        HStack{
            Text(firstItem).foregroundColor(.gray)
            Spacer()
            Text(secondItem)
        }
    }
}

#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
#endif
