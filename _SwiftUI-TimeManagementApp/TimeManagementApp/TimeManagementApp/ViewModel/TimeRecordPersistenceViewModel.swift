import CoreData

struct TimeRecordPersistenceViewModel {
    static let shared = TimeRecordPersistenceViewModel()

    static var preview: TimeRecordPersistenceViewModel = {
        let result = TimeRecordPersistenceViewModel(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newTimeRecord = TimeRecord(context: viewContext)
            newTimeRecord.strTime = "2020:09:26:21:00"
            newTimeRecord.endTime = "2020:09:26:22:00"
            newTimeRecord.wrkTime = "01:00:00"
            newTimeRecord.eventTitle = "デモデータ"
            newTimeRecord.eventMemo = "デモデータ"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "TimeManagementApp")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
