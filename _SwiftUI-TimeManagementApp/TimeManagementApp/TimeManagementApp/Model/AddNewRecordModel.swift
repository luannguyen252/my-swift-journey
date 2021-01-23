import SwiftUI

struct AddNewRecordModel: View {
    var body: some View {
        Text("Hello")
    }
    
    @Environment(\.managedObjectContext) var viewContext
    
    func AddNewRecord(sTime:String,eTime:String,wTime:String,eTitle:String,eMemo:String) {
        let newTimeRecord = TimeRecord(context: viewContext)
        newTimeRecord.strTime = sTime
        newTimeRecord.endTime = eTime
        newTimeRecord.wrkTime = wTime
        newTimeRecord.eventTitle = eTitle
        newTimeRecord.eventMemo = eMemo

        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
