//
//  ChooserPhotoCollectionViewController.swift
//  ARSocialPhotoApp
//
//  Created by sergio on 16/06/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import UIKit

class ChooserPhotoCollectionViewController: PhotoCollectionViewController {

    var callback : ((_ : UIImage?) -> Void)?

    override func viewDidLoad() {
        
        viewModel = PhotoCollectionViewModel(query: PhotoCollectionViewModel.anyQuery())
        super.viewDidLoad()
        bindToCurrentQuery(activityIndicator: nil)
    }
}

extension ChooserPhotoCollectionViewController  {
    
    override func collectionView(_ collectionView: UICollectionView,
                                 didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? PhotoCollectionViewCell {

            let image = cell.imageView?.image
            self.callback?(image)
            _ = navigationController?.popViewController(animated: true)
        }
    }
}
