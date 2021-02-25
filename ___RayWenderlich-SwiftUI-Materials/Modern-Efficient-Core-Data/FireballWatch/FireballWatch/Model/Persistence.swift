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

import CoreData
import Combine
import os.log

class PersistenceController: ObservableObject {
  // 
  private static let authorName = "FireballWatch"
  private static let remoteDataImportAuthorName = "Fireball Data Import"
  static let shared = PersistenceController()

  var viewContext: NSManagedObjectContext {
    return container.viewContext
  }

  private let container: NSPersistentContainer
  private var subscriptions: Set<AnyCancellable> = []
  private lazy var dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM d, yyyy"
    return formatter
  }()

  private lazy var historyRequestQueue = DispatchQueue(label: "history")
  private var lastHistoryToken: NSPersistentHistoryToken?
  private lazy var tokenFileURL: URL = {
    let url = NSPersistentContainer.defaultDirectoryURL().appendingPathComponent("FireballWatch", isDirectory: true)
    do {
      try FileManager.default
        .createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
    } catch {
      let nsError = error as NSError
      os_log(
        .error,
        log: .default,
        "Failed to create history token directory: %@",
        nsError)
    }
    return url.appendingPathComponent("token.data", isDirectory: false)
  }()

  init(inMemory: Bool = false) {
    container = NSPersistentContainer(name: "FireballWatch")
    let persistentStoreDescription = container.persistentStoreDescriptions.first

    if inMemory {
      persistentStoreDescription?.url = URL(fileURLWithPath: "/dev/null")
    }

    persistentStoreDescription?.setOption(
      true as NSNumber,
      forKey: NSPersistentStoreRemoteChangeNotificationPostOptionKey)
    persistentStoreDescription?.setOption(
      true as NSNumber,
      forKey: NSPersistentHistoryTrackingKey)

    container.loadPersistentStores { _, error in
      if let error = error as NSError? {
        os_log(.error, log: .default, "Error loading persistent store %@", error)
      }
    }

    viewContext.automaticallyMergesChangesFromParent = true
    viewContext.mergePolicy = NSMergePolicyType.mergeByPropertyObjectTrumpMergePolicyType
    viewContext.transactionAuthor = PersistenceController.authorName

    if !inMemory {
      do {
        try viewContext.setQueryGenerationFrom(.current)
      } catch {
        let nsError = error as NSError
        os_log(
          .error,
          log: .default,
          "Failed to pin viewContext to the current generation: %@",
          nsError)
      }
    }

    NotificationCenter.default
      .publisher(for: .NSPersistentStoreRemoteChange)
      .sink {
        self.processRemoteStoreChange($0)
      }
      .store(in: &subscriptions)

    loadHistoryToken()
  }

  func saveViewContext() {
    guard viewContext.hasChanges else { return }

    do {
      try viewContext.save()
    } catch {
      let nsError = error as NSError
      os_log(.error, log: .default, "Error saving changes %@", nsError)
    }
  }

  func deleteManagedObjects(_ objects: [NSManagedObject]) {
    viewContext.perform { [context = viewContext] in
      objects.forEach(context.delete)
      self.saveViewContext()
    }
  }

  func addNewFireballGroup(name: String) {
    viewContext.perform { [context = viewContext] in
      let group = FireballGroup(context: context)
      group.id = UUID()
      group.name = name
      self.saveViewContext()
    }
  }

  // MARK: Fetch Remote Data

  func fetchFireballs() {
    let source = RemoteDataSource()
    os_log(.info, log: .default, "Fetching fireballs...")
    source.fireballDataPublisher
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: { _ in
        os_log(.info, log: .default, "Fetching completed")
      }, receiveValue: { [weak self] in
        self?.batchInsertFireballs($0)
      })
      .store(in: &subscriptions)
  }

//  private func importFetchedFireballs(_ fireballs: [FireballData]) {
//    os_log(.info, log: .default, "Importing \(fireballs.count) fireballs")
//    container.performBackgroundTask { context in
//      context.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
//      fireballs.forEach {
//        let managedObject = Fireball(context: context)
//        managedObject.dateTimeStamp = $0.dateTimeStamp
//        managedObject.radiatedEnergy = $0.radiatedEnergy
//        managedObject.impactEnergy = $0.impactEnergy
//        managedObject.latitude = $0.latitude
//        managedObject.longitude = $0.longitude
//        managedObject.altitude = $0.altitude
//        managedObject.velocity = $0.velocity
//
//        do {
//          try context.save()
//        } catch {
//          let nsError = error as NSError
//          os_log(.error, log: .default, "Error importing fireball %@", nsError)
//        }
//      }
//    }
//  }

  private func batchInsertFireballs(_ fireballs: [FireballData]) {
    guard !fireballs.isEmpty else { return }

    os_log(
      .info,
      log: .default,
      "Batch inserting \(fireballs.count) fireballs")

    container.performBackgroundTask { context in
      context.transactionAuthor = PersistenceController.remoteDataImportAuthorName
      let batchInsert = self.newBatchInsertRequest(with: fireballs)
      do {
        try context.execute(batchInsert)
        os_log(.info, log: .default, "Finished batch inserting \(fireballs.count) fireballs")
      } catch {
        let nsError = error as NSError
        os_log(.error, log: .default, "Error batch inserting fireballs %@", nsError.userInfo)
      }
    }
  }

  private func newBatchInsertRequest(with fireballs: [FireballData]) -> NSBatchInsertRequest {
    var index = 0
    let total = fireballs.count
    let batchInsert = NSBatchInsertRequest(
      entity: Fireball.entity()) { (managedObject: NSManagedObject) -> Bool in
      guard index < total else { return true }

      if let fireball = managedObject as? Fireball {
        let data = fireballs[index]
        fireball.dateTimeStamp = data.dateTimeStamp
        fireball.radiatedEnergy = data.radiatedEnergy
        fireball.impactEnergy = data.impactEnergy
        fireball.latitude = data.latitude
        fireball.longitude = data.longitude
        fireball.altitude = data.altitude
        fireball.velocity = data.velocity
      }

      index += 1
      return false
    }
    return batchInsert
  }

  // MARK: - History Management

  private func loadHistoryToken() {
    do {
      let tokenData = try Data(contentsOf: tokenFileURL)
      lastHistoryToken = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSPersistentHistoryToken.self, from: tokenData)
    } catch {
      let nsError = error as NSError
      os_log(
        .error,
        log: .default,
        "Failed to load history token data file: %@",
        nsError)
    }
  }

  private func storeHistoryToken(_ token: NSPersistentHistoryToken) {
    do {
      let data = try NSKeyedArchiver
        .archivedData(withRootObject: token, requiringSecureCoding: true)
      try data.write(to: tokenFileURL)
      lastHistoryToken = token
    } catch {
      let nsError = error as NSError
      os_log(
        .error,
        log: .default,
        "Failed to write history token data file: %@",
        nsError)
    }
  }

  func processRemoteStoreChange(_ notification: Notification) {
    historyRequestQueue.async {
      let backgroundContext = self.container.newBackgroundContext()
      backgroundContext.performAndWait {
        let request = NSPersistentHistoryChangeRequest
          .fetchHistory(after: self.lastHistoryToken)

        if let historyFetchRequest = NSPersistentHistoryTransaction.fetchRequest {
          historyFetchRequest.predicate =
            NSPredicate(format: "%K != %@", "author", PersistenceController.authorName)
          request.fetchRequest = historyFetchRequest
        }

        do {
          let result = try backgroundContext.execute(request) as? NSPersistentHistoryResult
          guard
            let transactions = result?.result as? [NSPersistentHistoryTransaction],
            !transactions.isEmpty
          else {
            return
          }
          // Update the viewContext with the changes
          self.mergeChanges(from: transactions)

          if let newToken = transactions.last?.token {
          // Update the history token using the last transaction.
            self.storeHistoryToken(newToken)
          }
        } catch {
          let nsError = error as NSError
          os_log(
            .error,
            log: .default,
            "Persistent history request error: %@",
            nsError)
        }
      }
    }
  }

  private func mergeChanges(from transactions: [NSPersistentHistoryTransaction]) {
    let context = viewContext
    context.perform {
      transactions.forEach { transaction in
        guard let userInfo = transaction.objectIDNotification().userInfo else {
          return
        }

        NSManagedObjectContext
          .mergeChanges(fromRemoteContextSave: userInfo, into: [context])
      }
    }
  }
}

extension PersistenceController {
  static var preview: PersistenceController = {
    let controller = PersistenceController(inMemory: true)
    controller.viewContext.perform {
      for i in 0..<100 {
        controller.makeRandomFireball(context: controller.viewContext)
      }
      for i in 0..<5 {
        controller.makeRandomFireballGroup(context: controller.viewContext)
      }
    }
    return controller
  }()

  @discardableResult
  func makeRandomFireball(context: NSManagedObjectContext) -> Fireball {
    let fireball = Fireball(context: context)
    let timeSpan = Date().timeIntervalSince1970
    fireball.dateTimeStamp = Date(timeIntervalSince1970: Double.random(in: 0...timeSpan))
    fireball.radiatedEnergy = Double.random(in: 0...3)
    fireball.impactEnergy = Double.random(in: 0...400)
    fireball.latitude = Double.random(in: -90...90)
    fireball.longitude = Double.random(in: -180...180)
    fireball.altitude = Double.random(in: 1...20)
    fireball.velocity = Double.random(in: 200...2000)
    return fireball
  }

  @discardableResult
  func makeRandomFireballGroup(context: NSManagedObjectContext) -> FireballGroup {
    let group = FireballGroup(context: context)
    group.id = UUID()
    group.name = "Random Group"
    group.fireballs = [
      makeRandomFireball(context: context),
      makeRandomFireball(context: context),
      makeRandomFireball(context: context)
    ]
    return group
  }
}
