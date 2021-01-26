import Foundation
import CloudKit

class UserRecord {
    private let record: CKRecord

    var nickname: String? {
        get { record["nickname"] as? String }
        set { record.setValue(newValue, forKey: "nickname") }
    }

    init(record: CKRecord) {
        self.record = record
    }
}
