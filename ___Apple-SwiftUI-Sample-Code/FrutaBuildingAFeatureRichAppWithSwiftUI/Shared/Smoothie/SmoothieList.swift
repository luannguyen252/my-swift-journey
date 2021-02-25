/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A reusable view that can display a list of arbritary smoothies.
*/

import SwiftUI

struct SmoothieList: View {
    var smoothies: [Smoothie]
    
    @State private var selection: Smoothie.ID?
    @EnvironmentObject private var model: FrutaModel
    
    var body: some View {
        ScrollViewReader { proxy in
            List {
                ForEach(smoothies) { smoothie in
                    NavigationLink(
                        destination: SmoothieView(smoothie: smoothie).environmentObject(model),
                        tag: smoothie.id,
                        selection: $selection
                    ) {
                        SmoothieRow(smoothie: smoothie)
                    }
                    .tag(smoothie)
                    .onReceive(model.$selectedSmoothieID) { newValue in
                        // Need to make sure the Smoothie exists.
                        guard let smoothieID = newValue, let smoothie = Smoothie(for: smoothieID) else { return }
                        proxy.scrollTo(smoothie.id)
                        selection = smoothie.id
                    }
                }
            }
        }
    }
}

struct SmoothieList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach([ColorScheme.light, .dark], id: \.self) { scheme in
            NavigationView {
                SmoothieList(smoothies: Smoothie.all)
                    .navigationTitle("Smoothies")
                    .environmentObject(FrutaModel())
            }
            .preferredColorScheme(scheme)
        }
    }
}
