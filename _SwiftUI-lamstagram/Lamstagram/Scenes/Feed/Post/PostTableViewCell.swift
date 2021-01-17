//
//  PostTableViewCell.swift
//  Lamstagram
//
//  Created by Jan Kaltoun on 12/01/2020.
//  Copyright © 2020 Jan Kaltoun. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    @IBOutlet weak var userPhotoImageView: UIImageView!
    @IBOutlet weak var userNicknameLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    var viewModel: PostCellViewModel! {
        didSet {
            updateUI()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        clearUI()
        
        userPhotoImageView.layer.cornerRadius = userPhotoImageView.frame.width / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        clearUI()
    }
    
    func clearUI() {
        userPhotoImageView.image = nil
        userNicknameLabel.text = nil
        userNameLabel.text = nil
        photoImageView.image = nil
    }
    
    func updateUI() {
        userPhotoImageView.image = UIImage(named: viewModel.user.imageName)
        userNicknameLabel.text = viewModel.user.nickname
        userNameLabel.text = viewModel.user.name
        photoImageView.image = UIImage(named: viewModel.photoName)
    }
}

extension PostTableViewCell: NibLoadableView {}
