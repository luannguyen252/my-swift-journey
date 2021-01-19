//
//  KeyboardViewController.swift
//  PaperboardKeyboard
//
//  Created by Igor Zapletnev on 08.12.2020.
//  Copyright © 2020 Exyte. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    private let keyboardViewContoller = MainKeyboardViewController()
    
    private var heightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heightConstraint = self.view.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.8)
        heightConstraint.isActive = true
        
        self.addChild(keyboardViewContoller)
        self.view.addSubview(keyboardViewContoller.view)
        keyboardViewContoller.view.translatesAutoresizingMaskIntoConstraints = false
        keyboardViewContoller.view.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        keyboardViewContoller.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        keyboardViewContoller.view.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        keyboardViewContoller.view.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        
        keyboardViewContoller.inputProcessor = InputKeyboardProcessor(
            inputView: self,
            documentProxy: textDocumentProxy
        )
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        self.keyboardViewContoller.inputLayout.invalidateLayout()
    }
    
    func handleRotation() {
        if UIScreen.main.bounds.width > UIScreen.main.bounds.height {
            keyboardViewContoller.buttonsStackViews.forEach { $0.axis = .horizontal }
            heightConstraint.constant = UIScreen.main.bounds.height * 0.8
        } else {
            keyboardViewContoller.buttonsStackViews.forEach { $0.axis = .vertical }
            heightConstraint.constant = UIScreen.main.bounds.height * 0.7
        }
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        switch textDocumentProxy.keyboardAppearance {
        case .dark:
            keyboardViewContoller.setColorScheme(.dark)
        case .light:
            keyboardViewContoller.setColorScheme(.light)
        default:
            break
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)

        coordinator.animate(
            alongsideTransition: nil,
            completion: { [weak self] _ in
                self?.handleRotation()
                self?.keyboardViewContoller.inputCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: false)
            })
    }
    
}
