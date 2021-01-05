//
//  PhotoCollectionViewCell.swift
//  Photo2
//
//  Created by sergio on 31/03/2019.
//  Copyright © 2019 Sergio De Simone. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!

    var photoInfo = PhotoInfo() {
        
        willSet(newInfo) {
            
            let imageURL = URLIntoDocuments(newInfo.filename)
            if let image = UIImage(named: imageURL.path) {
                imageView.image = image
            }
        }
    }
}
