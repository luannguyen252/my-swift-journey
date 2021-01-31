import SwiftUI

struct GetButtonView: View {
    var body: some View {
        VStack {
            Button(action: {
                print("GET is pressed.")
            }) {
                Text("GET")
                    .font(.custom("TTFirsNeue-Bold", size: 14))
                    .foregroundColor(Color("dark"))
                    .padding(.vertical, 8)
                    .padding(.horizontal, 24)
                    .background(Color("pink"))
                    .clipShape(Capsule())
            }
            Text("In-App Purchases")
                .font(.custom("TTFirsNeue-Regular", size: 12))
                .foregroundColor(Color("dark4"))
        }
    }
}

struct GetButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GetButtonView()
    }
}
