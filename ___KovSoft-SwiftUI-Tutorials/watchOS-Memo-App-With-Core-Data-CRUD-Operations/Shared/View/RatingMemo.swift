import SwiftUI

struct RatingMemo: View {
    var body: some View {
        VStack {
            Text("No rating Memo app")
                .font(.custom("TTFirsNeue-Bold", size: 14))
                .foregroundColor(Color("light"))
        }
        .navigationTitle("Rating Memo")
    }
}

#if DEBUG
struct RatingMemo_Previews: PreviewProvider {
    static var previews: some View {
        RatingMemo()
    }
}
#endif
