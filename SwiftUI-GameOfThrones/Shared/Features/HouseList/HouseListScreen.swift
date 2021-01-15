import SwiftUI

struct HouseListScreen: View {
    @StateObject private var viewModel = HouseListViewModel()
    @Binding var selectedHouse: HouseMetadataModel?

    var body: some View {
        List(selection: $selectedHouse) {
            if viewModel.listState == .loading {
                ProgressView()
            } else {
                ForEach(viewModel.houseModels) { houseModel in
                    HouseRow(model: houseModel)
                }
            }
        }
        .navigationTitle("Houses")
    }
}

#if DEBUG
struct HouseListScreen_Previews: PreviewProvider {
    static var previews: some View {
        HouseListScreen(selectedHouse: .constant(nil))
    }
}
#endif
