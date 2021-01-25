//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SwiftUI
import Combine

class ImageListViewModel: ObservableObject {

    // MARK: Properties

    // Public

    var images: [ImageModel] = [] {
        willSet {
            DispatchQueue.main.async {
                self.objectWillChange.send()
            }
        }
    }

    var objectWillChange = ObservableObjectPublisher()

    /// Bindable Property used for showing/hiding ActivityIndicator.
    var isActive: Bool = false

    // Private

    private let pixaBayService: PixaBayServiceProtocol

    private var subscription: AnyCancellable?

    // MARK: Setup

    init(pixaBayService: PixaBayServiceProtocol) {
        self.pixaBayService = pixaBayService
    }

    // MARK: APIs

    func search(withTerm term: String) {

        self.isActive = true

        subscription = pixaBayService.fetch(searchTerm: term).sink(
            receiveCompletion: { [weak self] completion in
                if case let .failure(error) = completion {
                    print(error)
                    self?.images = []
                }
                self?.isActive = false
            },
            receiveValue: { [weak self] imageListModel  in
                self?.images = imageListModel.hits
            }
        )
    }
}
