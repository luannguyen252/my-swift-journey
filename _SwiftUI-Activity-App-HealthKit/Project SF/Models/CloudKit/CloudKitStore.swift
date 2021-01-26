import Foundation
import CloudKit

class CloudKitStore {
    // MARK: Static Properties
    static let shared = CloudKitStore(container: CKContainer.default())

    private static let queue = DispatchQueue(label: "com.wwdc.Project-SF.cloudkitqueue")

    // MARK: Properties
    private let container: CKContainer

    // MARK: Init
    init(container: CKContainer) {
        self.container = container
    }

    // MARK: Methods
    /// Asynchronously fetches records from the CloudKit database.
    /// Current Limitation: Doesn't handle paging correctly
    /// - Parameters:
    ///   - recordType: The type of record to fetch.
    ///   - predicate: Condition for records to be fetched.
    ///   - scope: The database scope.
    ///   - handler: Called with the result of the operation. Not guaranteed to be on the main thread.
    func fetchRecords(with recordType: CKRecord.RecordType,
                      predicate: NSPredicate = NSPredicate(value: true),
                      scope: CKDatabase.Scope,
                      then handler: @escaping (Result<[CKRecord], Error>) -> Void) {
        let query = CKQuery(recordType: recordType, predicate: predicate)
        let queryOperation = CKQueryOperation(query: query)

        var records = [CKRecord]()

        queryOperation.recordFetchedBlock = { record in
            Self.queue.sync {
                records.append(record)
            }
        }

        queryOperation.queryCompletionBlock = { cursor, error in
            Self.queue.sync {
                // TODO: Need to properly handle paging
                if let error = error {
                    handler(.failure(error))
                    return
                }

                handler(.success(records))
            }
        }

        let database = container.database(with: scope)
        database.add(queryOperation)
    }
    
    /// Asynchronously fetches a single record from the CloudKit database.
    /// - Parameters:
    ///   - recordID: The ID of the record you want to fetch.
    ///   - scope: The database scope
    ///   - handler: Called with the result of the operation. Not guaranteed to be on the main thread.
    func fetchRecord(with recordID: CKRecord.ID,
                     scope: CKDatabase.Scope,
                     then handler: @escaping (Result<CKRecord, Error>) -> Void) {
        let database = container.database(with: scope)

        database.fetch(withRecordID: recordID) { record, error in
            if let error = error {
                handler(.failure(error))
                return
            }
            guard let record = record else {
                handler(.failure(CloudKitStoreError.missingRecord))
                return
            }

            handler(.success(record))
        }
    }
    
    /// Asynchronously saves a single record to the CloudKit database, with a low priority.
    /// - Parameters:
    ///   - record: The record to save.
    ///   - scope: The database scope.
    ///   - handler: Called with the result of the operation. Not guaranteed to be on the main thread.
    func saveRecord(_ record: CKRecord,
                    scope: CKDatabase.Scope,
                    then handler: @escaping (Result<Void, Error>) -> Void) {
        let database = container.database(with: scope)

        database.save(record) { _, error in
            if let error = error {
                handler(.failure(error))
                return
            }
            handler(.success(()))
        }
    }
    
    /// Asynchronously deletes a single record to the CloudKit database, with a low priority.
    /// - Parameters:
    ///   - recordID: The ID of the record you want to delete.
    ///   - scope: The database scope.
    ///   - handler: Called with the result of the operation. Not guaranteed to be on the main thread.
    func deleteRecord(with recordID: CKRecord.ID,
                      scope: CKDatabase.Scope,
                      then handler: @escaping (Result<Void, Error>) -> Void) {
        let database = container.database(with: scope)

        database.delete(withRecordID: recordID) { _, error in
            if let error = error {
                handler(.failure(error))
                return
            }
            handler(.success(()))
        }
    }

    // MARK: - CloudKitStoreError
    enum CloudKitStoreError: Error {
        case missingRecord
    }
}
