//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Combine

protocol PixaBayServiceProtocol: ServiceProtocol {
    func fetch(searchTerm: String) -> Future<ImageListModel, Error>
}
