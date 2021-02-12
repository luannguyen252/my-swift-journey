//
//  AppIconsViewController.swift
//  AppIcons
//
//  Created by Ross Butler on 19/12/2019.
//

import Foundation
import UIKit
import FlexibleRowHeightGridLayout

class AppIconsViewController: UIViewController {
    
    private var _viewModel: IconsViewModel!
    
    override public func viewDidLoad() {
        self.title = _viewModel.title
        let layout = FlexibleRowHeightGridLayout()
        layout.delegate = self
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        if #available(iOS 13.0, *) {
            collectionView.backgroundColor = UIColor.systemBackground
        } else {
            collectionView.backgroundColor = UIColor.groupTableViewBackground
        }
        collectionView.register(IconCell.self, forCellWithReuseIdentifier: "icon-cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addPinnedSubview(collectionView)
    }
    
}

private extension AppIconsViewController {
    
    func closeButton() -> UIBarButtonItem {
        let closeButton: UIBarButtonItem
        if #available(iOS 13.0, *) {
            closeButton = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeTapped(_:)))
        } else {
            closeButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(closeTapped(_:)))
        }
        return closeButton
    }
    
    @objc func closeTapped(_ button: UIBarButtonItem) {
        _viewModel.viewControllerFinished()
    }
    
}

extension AppIconsViewController: ViewModelConfigurable {
    
    func configure(_ viewModel: IconsViewModel) {
        _viewModel = viewModel
    }
    
    func viewModel() -> IconsViewModel {
        return _viewModel
    }
    
}

extension AppIconsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _viewModel.selectIcon(at: indexPath)
    }
    
}

extension AppIconsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _viewModel.iconsCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "icon-cell", for: indexPath) as? IconCell else {
            return UICollectionViewCell()
        }
        if let icon = _viewModel.icon(at: indexPath) {
            cell.cornerRadius = icon.cornerRadius
            cell.iconName = icon.iconName
            cell.iconImage = icon.image
        }
        return cell
    }
    
}

extension AppIconsViewController: FlexibleRowHeightGridLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout: FlexibleRowHeightGridLayout, heightForItemAt indexPath: IndexPath) -> CGFloat {
        var result: CGFloat = 0
        if let icon = _viewModel.icon(at: indexPath),
            let image = icon.image {
            let fontSize = UIFont.systemFontSize
            let font = UIFont.systemFont(ofSize: fontSize)
            let textHeight = layout.textHeight(icon.iconName, font: font)
            result += textHeight
            let imageView = UIImageView(image: image)
            result += imageView.intrinsicContentSize.height
        }
        result += 30
        return result
    }
    
    func numberOfColumns(for size: CGSize) -> Int {
        return 3
    }
    
    
}
