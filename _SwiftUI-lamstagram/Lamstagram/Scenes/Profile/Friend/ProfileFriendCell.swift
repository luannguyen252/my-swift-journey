//
//  ProfileFriendCell.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 13/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class ProfileFriendCell: UICollectionViewCell {
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nicknameLabel: UILabel!
    
    var viewModel: ProfileFriendCellViewModel! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clearUI()
        
        profileImageView.layer.cornerRadius = 30
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        clearUI()
    }
    
    func clearUI() {
        profileImageView.image = nil
        nicknameLabel.text = nil
    }
    
    func updateUI() {
        profileImageView.image = UIImage(named: viewModel.user.imageName)
        nicknameLabel.text = viewModel.user.name
    }
}

extension ProfileFriendCell: NibLoadableView {}
