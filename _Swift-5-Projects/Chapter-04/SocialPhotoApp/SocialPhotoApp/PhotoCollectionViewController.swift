//
//  PhotoCollectionViewController.swift
//  Photo2
//
//  Created by sergio on 30/03/2019.
//  Copyright © 2019 Sergio De Simone. All rights reserved.
//

import UIKit
import FirebaseUI

private let reuseIdentifier = "PhotoCell"


class PhotoCollectionViewController: UICollectionViewController {

    var viewModel : PhotoCollectionViewModel!

    let activityIndicator = UIActivityIndicatorView(style: .gray)
    var dataSource : FUIFirestoreCollectionViewDataSource!
    
    func bindToCurrentQuery(activityIndicator: UIActivityIndicatorView?) {
        
        let q = viewModel.currentQuery
        self.dataSource = collectionView.bind(toFirestoreQuery: q) { view, indexPath, snap in

            if let activityIndicator = activityIndicator {
                activityIndicator.stopAnimating()
            }
            let cell = view.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                for: indexPath) as! PhotoCollectionViewCell
            
            cell.photoInfo = PhotoInfo(uid: snap.documentID,
                                       data: snap.data()!)
            return cell
        }
    }
}

extension PhotoCollectionViewController : UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsPerRow = 3
        let paddingSpace = 10 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
}

extension PhotoCollectionViewController : UINavigationControllerDelegate {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoCell = sender as? PhotoCollectionViewCell,
            let vc = segue.destination as? PhotoViewController {
                vc.photoInfo = photoCell.photoInfo
            vc.callback = { info in
                self.viewModel.updatePhoto(photo: info)
                //self.collectionView.reloadData()
            }
        }
    }
}

extension PhotoCollectionViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        let activityIndicator = UIActivityIndicatorView(style: .gray)
        textField.addSubview(activityIndicator)
        activityIndicator.frame = CGRect(x: textField.bounds.size.width - 32,
                                         y: 0, width: 32, height: textField.bounds.size.height)
        activityIndicator.startAnimating()

        viewModel.currentTag = textField.text
        bindToCurrentQuery(activityIndicator: activityIndicator)

        return true
    }

}
