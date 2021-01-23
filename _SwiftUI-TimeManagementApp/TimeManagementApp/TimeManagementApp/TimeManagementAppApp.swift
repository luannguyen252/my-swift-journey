import SwiftUI

@main
struct TimeManagementAppApp: App {
    let persistenceViewModel = TimeRecordPersistenceViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            TimeStartView()
                .environment(\.managedObjectContext, persistenceViewModel.container.viewContext).environmentObject(RecordViewModel())
        }
    }
}
