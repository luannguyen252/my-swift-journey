//
//  PhotoCollectionViewController.swift
//  Photo2
//
//  Created by sergio on 30/03/2019.
//  Copyright © 2019 Sergio De Simone. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class PhotoCollectionViewController: UICollectionViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate, UICollectionViewDelegateFlowLayout {

    let imagePicker = UIImagePickerController()
    let viewModel : PhotoCollectionViewModel = PhotoCollectionViewModel()
    let activityIndicator = UIActivityIndicatorView(style: .gray)
    
    @IBAction func addFromCamera(_ sender: Any) {
        presentPicker(.camera, delegate: self)
    }
    
    @IBAction func addFromRoll(_ sender: Any) {
        presentPicker(.photoLibrary, delegate: self)
    }
    
//////////////////////////////////////////////////////////////

    private func presentPicker(_ type : UIImagePickerController.SourceType,
                               delegate: UIImagePickerControllerDelegate & UINavigationControllerDelegate) {

        imagePicker.delegate = delegate
        imagePicker.sourceType = type
        present(imagePicker, animated: true, completion: nil)
    }
        
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imagePicker.dismiss(animated: true) {
            if let image = info[.originalImage] as? UIImage {
                self.viewModel.addPhoto(image: image)
                self.collectionView.reloadData()
            }
        }
    }
    
//////////////////////////////////////////////////////////////

    override func viewDidLoad() {
        super.viewDidLoad()

        checkPhotoLibraryPermission()
        
    }
    
//////////////////////////////////////////////////////////////

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView,
                                 numberOfItemsInSection section: Int) -> Int {
        
        return viewModel.photoCount()
    }

    override func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        // reuse cell for performance
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                      for: indexPath) as! PhotoCollectionViewCell
        
        // retrieve the photo at the requested index
        cell.photoInfo = viewModel.photo(index: indexPath[1] + 1)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        let itemsPerRow = 3
        let paddingSpace = 10 * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - CGFloat(paddingSpace)
        let widthPerItem = availableWidth / CGFloat(itemsPerRow)
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    
//////////////////////////////////////////////////////////////

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let photoCell = sender as? PhotoCollectionViewCell,
            let vc = segue.destination as? PhotoViewController {
                vc.photoInfo = photoCell.photoInfo
            vc.callback = { info in
                update(db: self.viewModel.photoStore, info)
                self.collectionView.reloadData()
            }
        }
    }

//////////////////////////////////////////////////////////////

    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

        textField.addSubview(activityIndicator)
        activityIndicator.frame = CGRect(x: textField.bounds.size.width - 32,
                                         y: 0, width: 32, height: textField.bounds.size.height)
        activityIndicator.startAnimating()

        viewModel.currentTag = textField.text
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
        }
        return true
    }
}
