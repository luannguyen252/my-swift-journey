//
//  PhotoDetailViewModel.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 14/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import Foundation

final class PhotoDetailViewModel {
    weak var delegate: PhotoDetailViewModelDelegate?

    var state: State = .initial {
        didSet {
            DispatchQueue.main.async {
                self.delegate?.stateDidChange(previousState: oldValue)
            }
        }
    }
    
    var photoName: String? {
        didSet {
            self.state = .ready
        }
    }
}

// MARK: - ViewModeling

extension PhotoDetailViewModel: ViewModeling {}
