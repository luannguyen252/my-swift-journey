//
//  ProfileHeaderCell.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 13/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UICollectionViewCell {
    @IBOutlet weak var profilePhotoImageView: UIImageView!
    @IBOutlet weak var numberOfPostsLabel: UILabel!
    @IBOutlet weak var numberOfFollowersLabel: UILabel!
    @IBOutlet weak var numberOfFollowedLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var viewModel: ProfileHeaderCellViewModel! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clearUI()
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoImageView.frame.width / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        clearUI()
    }
    
    func clearUI() {
        profilePhotoImageView.image = nil
        numberOfPostsLabel.text = nil
        numberOfFollowersLabel.text = nil
        numberOfFollowedLabel.text = nil
        descriptionLabel.text = nil
    }
    
    func updateUI() {
        profilePhotoImageView.image = UIImage(named: viewModel.user.imageName)
        numberOfPostsLabel.text = String(viewModel.user.numberOfPosts)
        numberOfFollowersLabel.text = String(viewModel.user.numberOfFollowers)
        numberOfFollowedLabel.text = String(viewModel.user.numberFollowing)
        descriptionLabel.text = viewModel.user.description
    }
}

extension ProfileHeaderCell: NibLoadableView {}
