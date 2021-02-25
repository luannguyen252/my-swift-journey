/// Copyright (c) 2020 Razeware LLC
/// 
/// Permission is hereby granted, free of charge, to any person obtaining a copy
/// of this software and associated documentation files (the "Software"), to deal
/// in the Software without restriction, including without limitation the rights
/// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
/// copies of the Software, and to permit persons to whom the Software is
/// furnished to do so, subject to the following conditions:
/// 
/// The above copyright notice and this permission notice shall be included in
/// all copies or substantial portions of the Software.
/// 
/// Notwithstanding the foregoing, you may not use, copy, modify, merge, publish,
/// distribute, sublicense, create a derivative work, and/or sell copies of the
/// Software in any work that is designed, intended, or marketed for pedagogical or
/// instructional purposes related to programming, coding, application development,
/// or information technology.  Permission for such use, copying, modification,
/// merger, publication, distribution, sublicensing, creation of derivative works,
/// or sale is expressly withheld.
/// 
/// This project and source code may use libraries or frameworks that are
/// released under various Open-Source licenses. Use of those libraries and
/// frameworks are governed by their own individual licenses.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
/// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
/// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
/// THE SOFTWARE.

import SwiftUI
import CoreData

struct FireballGroupList: View {
  static var fetchRequest: NSFetchRequest<FireballGroup> {
    let request: NSFetchRequest<FireballGroup> = FireballGroup.fetchRequest()
    request.sortDescriptors = [NSSortDescriptor(keyPath: \FireballGroup.name, ascending: true)]
    return request
  }
  @EnvironmentObject private var persistence: PersistenceController
  @Environment(\.managedObjectContext) private var viewContext
  @FetchRequest(
    fetchRequest: FireballGroupList.fetchRequest,
    animation: .default)
  private var groups: FetchedResults<FireballGroup>

  @State var addGroupIsPresented = false

  var body: some View {
    NavigationView {
      List {
        ForEach(groups, id: \.id) { group in
          NavigationLink(destination: FireballGroupDetailsView(fireballGroup: group)) {
            HStack {
              Text("\(group.name ?? "Untitled")")
              Spacer()
              Image(systemName: "sun.max.fill")
              Text("\(group.fireballCount)")
            }
          }
        }
        .onDelete(perform: deleteObjects)
      }
      .sheet(isPresented: $addGroupIsPresented) {
        AddFireballGroup { name in
          addNewGroup(name: name)
          addGroupIsPresented = false
        }
      }
      .navigationBarTitle(Text("Fireball Groups"))
      .navigationBarItems(trailing:
        // swiftlint:disable:next multiple_closures_with_trailing_closure
        Button(action: { addGroupIsPresented.toggle() }) {
          Image(systemName: "plus")
        }
      )
    }
  }

  private func deleteObjects(offsets: IndexSet) {
    withAnimation {
      persistence.deleteManagedObjects(offsets.map { groups[$0] })
    }
  }

  private func addNewGroup(name: String) {
    withAnimation {
      persistence.addNewFireballGroup(name: name)
    }
  }
}

struct GroupList_Previews: PreviewProvider {
  static var previews: some View {
    FireballGroupList()
      .environment(\.managedObjectContext, PersistenceController.preview.viewContext)
      .environmentObject(PersistenceController.preview)
  }
}
