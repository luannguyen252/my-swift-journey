import SwiftUI

struct Toolbar: View {
    var body: some View {
        // Navigation View Toolbar
//        NavigationView {
//            Text("My app")
//            .toolbar {
//                ToolbarItem {
//                    Image(systemName: "person.crop.circle")
//                }
//            }
//        }
        
        // ToolbarItem Placement
//        ToolbarItem(placement: .bottomBar) {
//            Button(action: {}) {
//                Image(systemName: "person.crop.circle")
//            }
//        }
        
        // ToolbarItemGroup
//        ToolbarItemGroup(placement: .confirmationAction) {
//            Image(systemName: "person")
//            Image(systemName: "ellipsis")
//        }
//        ToolbarItemGroup(placement: .bottomBar) {
//            Image(systemName: "person")
//            Spacer()
//            Image(systemName: "ellipsis")
//            Spacer()
//            Image(systemName: "trash")
//        }
        // Final Code
        NavigationView {
            Text("My app")
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Image(systemName: "person")
                    HStack {
                        Image(systemName: "ellipsis")
                        Divider()
                        Image(systemName: "trash")
                            .frame(width: 32, height: 32)
                            .background(Color.blue)
                            .mask(Circle())
                    }
                }
            }
        }
    }
}

#if DEBUG
struct Toolbar_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar()
    }
}
#endif
