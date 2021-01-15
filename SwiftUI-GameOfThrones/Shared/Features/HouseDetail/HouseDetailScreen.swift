import SwiftUI

struct HouseDetailScreen: View {
    @StateObject private var viewModel = HouseDetailViewModel()

    let url: URL

    var body: some View {
        switch viewModel.state {
        case .idle:
            ProgressView()
                .onAppear {
                    viewModel.loadHouse(atURL: url)
                }
        case .loading:
            ProgressView()
        case .loaded(let model):
            List {
                HouseFactsView(
                    name: model.name,
                    region: model.region,
                    coatOfArms: model.coatOfArms,
                    words: model.words,
                    currentLord: model.currentLord,
                    heir: model.heir,
                    overlord: model.overlord,
                    founded: model.founded,
                    founder: model.founder,
                    diedOut: model.diedOut
                )

                Section(header: Text("\(model.titles.count) Titles")) {
                    HouseTitlesView(titles: model.titles)
                }

                Section(header: Text("\(model.seats.count) Seats")) {
                    HouseSeatsView(seats: model.seats)
                }

                Section(header: Text("\(model.ancestralWeapons.count) Ancestral Weapons")) {
                    HouseAncestralWeaponsView(ancestralWeapons: model.ancestralWeapons)
                }

                Section(header: Text("\(model.cadetBranches.count) Cadet Branches")) {
                    HouseCadetBranchesView(cadetBranches: model.cadetBranches)
                }

                Section(header: Text("\(model.swornMembers.count) Sworn Members")) {
                    HouseSwornMembersView(swornMembers: model.swornMembers)
                }
            }
            .listStyle(SidebarListStyle())
            .navigationTitle(Text(model.name))
            .onChange(of: url) { newValue in
                viewModel.loadHouse(atURL: newValue)
            }
        }
    }
}

#if DEBUG
struct HouseDetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        HouseDetailScreen(url: URL(string: "https://duckduckgo.com")!)
    }
}
#endif
