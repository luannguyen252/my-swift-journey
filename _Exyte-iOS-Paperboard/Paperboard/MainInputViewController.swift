//
//  ViewController.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 16.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import UIKit

class MainInputViewController: MainKeyboardViewController {
    
    @IBOutlet private weak var inputField: UITextField!
    
    @IBAction private func showSettings(_ sender: UIBarButtonItem!) {
        let settingsProcessor = SettingsProcessor(settings: settings)
        settingsProcessor.showSettings(onController: self, byBarButton: sender)
    }
    
    override func viewDidLoad() {
        inputProcessor = InputFieldProcessor(inputField: inputField)
        super.viewDidLoad()
        
        setColorScheme(.light)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        inputSource.reload()
        inputCollectionView.reloadData()
        inputCollectionProcessor.scrollsToMiddleSection(inputCollectionView)
        inputField.becomeFirstResponder()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        let visibleIndex = inputCollectionView.indexPathsForVisibleItems.min()
        coordinator.animate(
            alongsideTransition: nil,
            completion: { [weak self] (context) in
                self?.inputLayout.prepare()
                guard let nIndexPath = visibleIndex else {
                    return
                }
                self?.inputCollectionView.reloadData()
                self?.inputCollectionView.scrollToItem(at: nIndexPath, at: .left, animated: false)
            })
    }
}
