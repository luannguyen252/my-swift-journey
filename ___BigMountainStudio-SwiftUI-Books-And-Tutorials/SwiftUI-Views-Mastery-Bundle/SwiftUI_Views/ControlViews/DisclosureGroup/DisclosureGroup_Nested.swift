//  Copyright © 2020 Mark Moeykens. All rights reserved. | @BigMtnStudio

import SwiftUI

struct DisclosureGroup_Nested: View {
    @State private var disclosureExpanded = false
    @State private var sunExpanded = false
    @State private var cloudsExpanded = false
    
    var body: some View {
        VStack(spacing: 20) {
            HeaderView("DisclosureGroup",
                       subtitle: "Nested",
                       desc: "You can nest disclosure groups to allow users to drill down into views.",
                       back: .orange)
            
            DisclosureGroup(
                isExpanded: $disclosureExpanded,
                content: {
                    VStack {
                        DisclosureGroup("Sun", isExpanded: $sunExpanded) {
                            HStack(spacing: 40) {
                                Image(systemName: "sunrise.fill")
                                Image(systemName: "sun.min.fill")
                                Image(systemName: "sun.max.fill")
                                Image(systemName: "sunset.fill")
                            }.padding(.vertical)
                        }
                        
                        DisclosureGroup("Clouds", isExpanded: $cloudsExpanded) {
                            HStack(spacing: 40) {
                                Image(systemName: "cloud.fill")
                                Image(systemName: "cloud.drizzle.fill")
                                Image(systemName: "cloud.bolt.fill")
                                Image(systemName: "smoke.fill")
                            }.padding(.vertical)
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.orange)
                                    .opacity(0.1))
                },
                label: {
                    HStack(spacing: 20) {
                        Image(systemName: "sun.max")
                        Text("Weather")
                    }
                })
                .padding(.horizontal)
            
            Spacer()
        }
        .font(.title)
    }
}

struct DisclosureGroup_Nested_Previews: PreviewProvider {
    static var previews: some View {
        DisclosureGroup_Nested()
    }
}
