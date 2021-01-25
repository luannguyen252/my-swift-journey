//
//  Copyright © 2019 An Tran. All rights reserved.
//

protocol ServiceProtocol {
    var name: String { get }
}

extension ServiceProtocol {
    var name: String {
        return String(describing: self)
    }
}
