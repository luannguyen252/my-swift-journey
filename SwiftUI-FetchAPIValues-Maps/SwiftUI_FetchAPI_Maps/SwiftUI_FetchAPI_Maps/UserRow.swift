

import SwiftUI

struct UserRow: View {
    let user: User
    var body: some View {
        return NavigationLink(destination: UserDetail(user: user)) {
            VStack(alignment: .center) {
                ImageViewContainer(imageURL: user.imageURL)
                Text(user.name).font(.system(size: 23))
                    .bold()
                Text(user.email).font(.system(size: 23))
                Text(user.company.name).font(.system(size: 21))
                Text(user.website).font(.system(size: 21))
                Text(user.phone).font(.system(size: 21))
            }
        }
    }
}
