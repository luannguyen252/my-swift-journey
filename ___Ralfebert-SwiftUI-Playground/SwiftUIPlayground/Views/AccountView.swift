// SwiftUIPlayground
// https://github.com/ralfebert/SwiftUIPlayground/

import ImagePickerView
import SwiftUI

/// https://stackoverflow.com/questions/61844491/how-can-i-create-an-unfilled-frame-in-swiftui
struct AccountView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Account Balance")
                .font(.largeTitle)
            Text("Account Name")
                .font(.headline)
            HStack(spacing: 0) {
                Text("There are ")
                    .font(.caption)
                    .foregroundColor(.gray)
                Text("6 ")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                Text("unreconciled transactions.")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding(20)
        .background(Color.white)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 2))
    }

}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
