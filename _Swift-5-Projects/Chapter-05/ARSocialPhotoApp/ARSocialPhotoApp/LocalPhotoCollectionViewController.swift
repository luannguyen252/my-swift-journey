//
//  LocalPhotoCollectionViewController.swift
//  SocialPhotoApp
//
//  Created by sergio on 23/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import UIKit
import Firebase

class LocalPhotoCollectionViewController: PhotoCollectionViewController {
    
    fileprivate var authStateDidChangeHandle: AuthStateDidChangeListenerHandle?
    fileprivate var auth = Auth.auth()
    
    let imagePicker = UIImagePickerController()
    
    @IBAction func addFromCamera(_ sender: Any) {
        presentPicker(.camera, delegate: self)
    }
    
    @IBAction func addFromRoll(_ sender: Any) {
        presentPicker(.photoLibrary, delegate: self)
    }

    //////////////////////////////////////////////////////////////
    
    fileprivate func updateModel() {
        
        /*************************************************************************
         If your app crashes when switching users with an error similar to this:
         "Terminating app due to uncaught exception 'NSInternalInconsistencyException', reason:
         'Invalid update: invalid number of items in section 0. etc."
         This could be due to a known, recurring bug in FirebaseUI when binding a new query
         to a controller.
         (https://github.com/firebase/FirebaseUI-iOS/issues/234)
         What we could do here, as a workaround, is to reset the datasource and reload the collection
         view data, then wait some time for the UI to stabilise. Finally, we issue the model update.
         
         var deadlineTime = DispatchTime.now() + .seconds(0)
         if self.dataSource != nil {
         self.dataSource = nil
         collectionView.reloadData()
         deadlineTime = DispatchTime.now() + .milliseconds(500)
         }
         DispatchQueue.main.asyncAfter(deadline: deadlineTime) {
         self.viewModel = PhotoCollectionViewModel(query: PhotoCollectionViewModel.userQuery())
         self.bindToCurrentQuery(activityIndicator: nil)
         }
         
         If you experience no crashes, you can leave the following code in place:
         ******************************************************************************/
        
        self.viewModel = PhotoCollectionViewModel(query: PhotoCollectionViewModel.userQuery())
        self.bindToCurrentQuery(activityIndicator: nil)
        
    }
    
    //////////////////////////////////////////////////////////////
    
    override func viewDidLoad() {
        
        self.viewModel = PhotoCollectionViewModel(query: PhotoCollectionViewModel.userQuery())
        super.viewDidLoad()
        
        let longPress = UILongPressGestureRecognizer(target: self,
                                                     action: #selector(self.handleLongPress))
        longPress.delegate = self;
        longPress.delaysTouchesBegan = true;
        longPress.minimumPressDuration = 1;
        //        longPress.numberOfTouchesRequired = 2;
        
        checkPhotoLibraryPermission()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        self.authStateDidChangeHandle =
            self.auth.addStateDidChangeListener(self.updateUI(auth:user:))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let handle = self.authStateDidChangeHandle {
            self.auth.removeStateDidChangeListener(handle)
        }
    }

    /////////////////////////////////////////////////////////
    // This is called when the user changes their sign-in state
    func updateUI(auth: Auth, user: User?) {
        
        if self.auth.currentUser != nil {
            DispatchQueue.main.async {
                self.updateModel()
            }
        }
    }
}

extension LocalPhotoCollectionViewController: UIImagePickerControllerDelegate {
    
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
                //self.collectionView.reloadData()
            }
        }
    }
}

extension LocalPhotoCollectionViewController: UIGestureRecognizerDelegate {

    @objc func handleLongPress(gesture : UILongPressGestureRecognizer!) {
        
        let p = gesture.location(in: self.collectionView)
        if let indexPath = self.collectionView.indexPathForItem(at: p) {
            let cell = self.collectionView.cellForItem(at: indexPath) as! PhotoCollectionViewCell
            viewModel.removePhoto(photo: cell.photoInfo)
        } else {
            print("couldn't find index path")
        }
        gesture.state = .ended
    }
}
