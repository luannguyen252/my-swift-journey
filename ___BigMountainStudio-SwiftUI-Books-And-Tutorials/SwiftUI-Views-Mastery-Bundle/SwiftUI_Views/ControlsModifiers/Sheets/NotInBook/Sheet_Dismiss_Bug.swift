//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct MyItem: Identifiable {
    let id = UUID()
    let name: String
    let message: String
}

struct Sheet_Dismiss_Bug: View {
    @State private var selection: MyItem? = nil
    
    var body: some View {

        VStack {
            Button("First Sheet") {
                self.selection = MyItem(name: "First Name", message: "Working with First Name")
            }

            Button("Last Name") {
                self.selection = MyItem(name: "Last Name", message: "Working with Last Name")
            }

        }
        .sheet(item: $selection,
               onDismiss: { print("finished!") },
               content: { MySheet(item: $0) })
        
    }
}

struct MySheet: View {
    let item: MyItem
    @Environment (\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text(item.name)
            Text(item.message)
            Divider()
            Text("Drag down to dismiss..., or")
            Text("Tap to Dismiss")
                .onTapGesture {
                    // Dismissing programmatically, instead of using the gesture,
                    // will not trigger the onDismiss callback
                    // If you need to perform a task on dismissal, do it here.
                    self.presentationMode.wrappedValue.dismiss()
            }

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
        .ignoresSafeArea()
    }
}

struct Sheet_Dismiss_Bug_Previews: PreviewProvider {
    static var previews: some View {
        Sheet_Dismiss_Bug()
    }
}
