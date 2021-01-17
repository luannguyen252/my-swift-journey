//
//  ProfilePhotoCell.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 13/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class ProfilePhotoCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    var viewModel: ProfilePhotoCellViewModel! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clearUI()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        clearUI()
    }
    
    func clearUI() {
        photoImageView.image = nil
    }
    
    func updateUI() {
        photoImageView.image = UIImage(named: viewModel.post.imageName)
    }
}

extension ProfilePhotoCell: NibLoadableView {}
