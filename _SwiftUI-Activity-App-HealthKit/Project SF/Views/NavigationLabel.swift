import SwiftUI

struct NavigationLabel<Destination: View>: View {
    let title: String
    let systemName: String
    let destination: Destination

    var body: some View {
        NavigationLink(
            destination: destination,
            label: {
                Label(title, systemImage: systemName)
            })
    }
}

//struct NavigationLabel_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationLabel()
//    }
//}
