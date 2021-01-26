import Foundation
import UIKit

extension ProcessInfo {
    var isTesting: Bool {
        #if DEBUG
        return environment["XCTestConfigurationFilePath"] != nil
        #else
        return false
        #endif
    }
}
