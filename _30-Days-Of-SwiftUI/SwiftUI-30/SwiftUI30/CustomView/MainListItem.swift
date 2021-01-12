import SwiftUI

struct MainListItem: View {
    var title:String
    var description:String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
                .font(.system(size: 18))
                .padding(.bottom, 2)
            Text(description)
                .font(.system(size: 14))
        }
        .padding(.vertical, 3)
    }
}

struct MainListItem_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            MainListItem(title: "Test", description: "test")
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
