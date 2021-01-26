import SwiftUI

struct ProfileSettingsView: View {
    @State var username = ""
    @State var isShowingAlert = false

    var body: some View {
        VStack {
            Form {
                TextField("Enter your name", text: $username) { (didChange) in
                    print(didChange)
                } onCommit: {
                    guard !username.isEmpty else {
                        isShowingAlert = true
                        return
                    }
                }
            }
        }
        .alert(isPresented: $isShowingAlert) {
            Alert(title: Text("Please, fill in your name"), message: nil, dismissButton: .default(Text("Ok")))
        }
    }

    init() {
        username = UserDefaults.standard.string(forKey: "username") ?? ""
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
