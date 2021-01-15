import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dependencyContainer: DependencyContainer
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
            VStack(spacing: 32) {
                Text(viewModel.refreshTimestamp)
                Button(action: viewModel.refresh, label: {
                    Text("Refresh")
                })
            }
            Spacer()
            
            BottomBarView(viewModel: BottomBarViewModel(entryStore: dependencyContainer.entryStore))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
