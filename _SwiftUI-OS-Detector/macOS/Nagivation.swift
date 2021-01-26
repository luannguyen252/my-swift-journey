

import SwiftUI

struct Nagivation: View {
    var body: some View {
        Text("LoL")
    }
}

var NavigationMacOS: some View {
    NavigationView {
    List(Menu) { m in
        NavigationLink(
            destination: Text(m.name)) {
            Label(m.name, systemImage: m.icon)
        }
    }
    .listStyle(SidebarListStyle())
    }.navigationTitle("Menu")
}



struct Nagivation_Previews: PreviewProvider {
    static var previews: some View {
        Nagivation()
    }
}
