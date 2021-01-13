import SwiftUI

fileprivate typealias Key = UserDefaultTypedKey

extension UserDefaultTypedKeys {
    static let bookingDatas = Key<Array<BookingData>>("bookingDatas")
    static let dataReadAgain = Key<Set<BookingData>>("dataReadAgain")
}
