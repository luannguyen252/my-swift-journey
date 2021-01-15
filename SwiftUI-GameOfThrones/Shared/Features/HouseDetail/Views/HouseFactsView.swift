//
//  HouseFactsView.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 03.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import SwiftUI

struct HouseFactsView: View {
    let name: String
    let region: String
    let coatOfArms: String
    let words: String
    let currentLord: URL?
    let heir: URL?
    let overlord: URL?
    let founded: String
    let founder: URL?
    let diedOut: String
    
    var body: some View {
        Section(header: Text("Facts")) {
            VStack(alignment: .leading) {
                Text("Name")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(name)
                    .lineLimit(nil)
            }

            VStack(alignment: .leading) {
                Text("Region")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(region)
                    .lineLimit(nil)
            }

            VStack(alignment: .leading) {
                Text("Coat of arms")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(coatOfArms)
                    .lineLimit(nil)
            }

            VStack(alignment: .leading) {
                Text("Words")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(words)
                    .lineLimit(nil)
            }

            VStack(alignment: .leading) {
                Text("Founded")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(founded)
                    .lineLimit(nil)
            }

            VStack(alignment: .leading) {
                Text("Died out")
                    .font(.caption)
                    .foregroundColor(.secondary)

                Text(diedOut)
                    .lineLimit(nil)
            }

            VStack(alignment: .leading) {
                Text("Current lord")
                    .font(.caption)
                    .foregroundColor(.secondary)

                currentLord.map { currentLord in
                    Link(destination: currentLord) {
                        Text(currentLord.absoluteString)
                    }
                }

                if currentLord == nil {
                    Text("-")
                }
            }

            VStack(alignment: .leading) {
                Text("Heir")
                    .font(.caption)
                    .foregroundColor(.secondary)

                heir.map { heir in
                    Link(destination: heir) {
                        Text(heir.absoluteString)
                    }
                }

                if heir == nil {
                    Text("-")
                }
            }

            VStack(alignment: .leading) {
                Text("Overlord")
                    .font(.caption)
                    .foregroundColor(.secondary)

                overlord.map { overlord in
                    Link(destination: overlord) {
                        Text(overlord.absoluteString)
                    }
                }

                if overlord == nil {
                    Text("-")
                }
            }

            VStack(alignment: .leading) {
                Text("Founder")
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                founder.map { founder in
                    Link(destination: founder) {
                        Text(founder.absoluteString)
                    }
                }

                if founder == nil {
                    Text("-")
                }
            }
        }
    }
}

#if DEBUG
struct HouseFactsView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            HouseFactsView(
                name: "House name",
                region: "House region",
                coatOfArms: "House Code of Arms House Code of Arms House Code of Arms House Code of Arms House Code of Arms House Code of Arms House Code of Arms House Code of Arms",
                words: "House of Words",
                currentLord: nil,
                heir: nil,
                overlord: nil,
                founded: "1990",
                founder: nil,
                diedOut: "Unknown"
            )
        }
        .listStyle(SidebarListStyle())
    }
}
#endif
