import SwiftUI
import PlaygroundSupport

struct UserCell: View {
    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: "person.crop.circle.fill")
                .font(.system(size: 48))
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Full name")
                    .font(.system(size: 18, weight: .semibold))
                Text("Username")
                    .font(.system(size: 18))
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
        }
        .padding()
        .frame(width: 375, height: 80)
        .background(Color(UIColor.tertiarySystemFill))
        .cornerRadius(20)
    }
}

PlaygroundPage.current.setLiveView(UserCell())