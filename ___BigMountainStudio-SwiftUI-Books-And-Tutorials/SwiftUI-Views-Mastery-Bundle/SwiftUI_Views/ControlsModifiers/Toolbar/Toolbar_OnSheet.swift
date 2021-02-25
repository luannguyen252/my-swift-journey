//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct Toolbar_OnSheet: View {
    @State private var presentingSheet = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("Toolbar",
                           subtitle: "On a Sheet",
                           desc: "The toolbar modifier will place items differently on a sheet depending on the placement parameter.",
                           back: .green)
                
                Button("Show Sheet") {
                    self.presentingSheet = true
                }
                .sheet(isPresented: $presentingSheet) {
                    ConfirmationView()
                }
                Spacer()
            }
            .font(.title)
        }
    }
}
struct ConfirmationView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                HeaderView("Toolbar",
                           subtitle: "On a Sheet",
                           desc: "Notice the ToolbarItems are now at the top.",
                           back: .green)
                Spacer()
            }
            .padding(.top)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirm", action: { presentation.wrappedValue.dismiss() })
                }
                
                ToolbarItem(placement: .destructiveAction) {
                    Button("Delete", action: { presentation.wrappedValue.dismiss() })
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel", action: { presentation.wrappedValue.dismiss() })
                }
            }
        }
    }
}

struct Toolbar_OnSheet_Previews: PreviewProvider {
    static var previews: some View {
        Toolbar_OnSheet()
    }
}
