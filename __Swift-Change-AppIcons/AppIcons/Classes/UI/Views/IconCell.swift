//
//  IconCell.swift
//  AppIcons
//
//  Created by Ross Butler on 20/12/2019.
//

import Foundation
import UIKit

class IconCell: UICollectionViewCell {
    
    var cornerRadius: CGFloat? {
        didSet {
            guard let imageView = self.imageView,
                let cornerRadius = cornerRadius else {
                return
            }
            imageView.clipsToBounds = true
            imageView.layer.cornerRadius = cornerRadius
        }
    }
    
    var iconName: String? {
        get {
            return iconLabel?.text
        }
        set {
            guard let iconLabel = self.iconLabel else {
                let iconLabel = UILabel(frame: CGRect.zero)
                iconLabel.numberOfLines = 0
                iconLabel.lineBreakMode = .byWordWrapping
                iconLabel.text = newValue
                contentView.addSubview(iconLabel)
                self.iconLabel = iconLabel
                if iconImage == nil {
                    contentView.pinVertically(iconLabel, vPadding: 10)
                } else {
                    layoutImageWithLabel(hPadding: 0, vPadding: 10)
                }
                return
            }
            iconLabel.text = newValue
        }
    }
    
    var iconImage: UIImage? {
        get {
            return imageView?.image
        }
        set {
            guard let imageView = self.imageView else {
                let imageView = UIImageView(image: newValue)
                contentView.addSubview(imageView)
                self.imageView = imageView
                self.applyEqualWidthAndHeight(imageView, height: 80.0)
                if iconName == nil {
                    contentView.pinVertically(imageView, vPadding: 10)
                } else {
                    layoutImageWithLabel(hPadding: 0, vPadding: 10)
                }
                if let cornerRadius = cornerRadius {
                    imageView.clipsToBounds = true
                    imageView.layer.cornerRadius = cornerRadius
                }
                layoutIfNeeded()
                return
            }
            imageView.image = newValue
            layoutIfNeeded()
        }
    }
    
    private weak var iconLabel: UILabel?
    private weak var imageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        pinToSides(contentView)
        if #available(iOS 13.0, *) {
            contentView.backgroundColor = UIColor.secondarySystemBackground
        } else {
            contentView.backgroundColor = UIColor.groupTableViewBackground
        }
    }
    
    func layoutImageWithLabel(hPadding: Float = 0, vPadding: Float = 0) {
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.removeConstraints(contentView.constraints)
        pinToSides(contentView)
        guard let iconLabel = self.iconLabel, let imageView = self.imageView else {
            return
        }
        imageView.translatesAutoresizingMaskIntoConstraints = false
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.centerHorizontally(iconLabel)
        contentView.centerHorizontally(imageView)
        let metrics = ["vPadding": NSNumber(value: vPadding),
                       "hPadding": NSNumber(value: hPadding)]
        let views = ["label": iconLabel, "icon": imageView]
        let vConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-(>=vPadding)-[icon]-(vPadding)-[label]-(>=vPadding)-|", options: [], metrics: metrics, views: views)
        addConstraints(vConstraints)
    }
    
}
