import SwiftUI

struct BottomBarView: View {
    @StateObject var viewModel: BottomBarViewModel
    
    var body: some View {
        Text(viewModel.text)
    }
}

struct BottomBarView_Previews: PreviewProvider {
    static var previews: some View {
        BottomBarView(viewModel: BottomBarViewModel(entryStore: EntryStore()))
    }
}
