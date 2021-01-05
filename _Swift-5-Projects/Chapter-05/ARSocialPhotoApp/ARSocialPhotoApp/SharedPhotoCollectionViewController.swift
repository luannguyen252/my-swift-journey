//
//  SharedPhotoCollectionViewController.swift
//  SocialPhotoApp
//
//  Created by sergio on 23/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import UIKit

class SharedPhotoCollectionViewController: PhotoCollectionViewController {
    
    override func viewDidLoad() {

        viewModel = PhotoCollectionViewModel(query: PhotoCollectionViewModel.publicQuery())
        super.viewDidLoad()
        bindToCurrentQuery(activityIndicator: nil)
    }
}
