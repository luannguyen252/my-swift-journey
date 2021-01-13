import Foundation
import Combine

protocol ModelProtocol: ObservableObject {
    var bookingDatas: [BookingData] { get set }
}
