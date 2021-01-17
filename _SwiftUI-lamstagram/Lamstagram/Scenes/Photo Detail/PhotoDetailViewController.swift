//
//  PhotoDetailViewController.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 13/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var viewModel: PhotoDetailViewModel
    
    init?(coder: NSCoder, viewModel: PhotoDetailViewModel) {
        self.viewModel = viewModel
        
        super.init(coder: coder)
        
        self.viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this view controller with a ViewModel.")
    }
}

extension PhotoDetailViewController: PhotoDetailViewModelDelegate {
    func stateDidChange(previousState: State) {
        switch viewModel.state {
        case .ready:
            photoImageView.image = UIImage(named: viewModel.photoName!)
        default:
            photoImageView.image = nil
        }
    }
}
