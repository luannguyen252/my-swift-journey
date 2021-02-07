//
//  ViewController.swift
//  PopoverPresentationController
//
//  Created by Arifin Firdaus on 05/10/20.
//  Copyright © 2020 Arifin Firdaus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didTapPopButton(_ sender: UIBarButtonItem) {
        let menuViewController = makeMenuViewController()
        
        let popoverPresentationController = menuViewController.popoverPresentationController
        popoverPresentationController?.permittedArrowDirections = .any
        popoverPresentationController?.delegate = self
        popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        popoverPresentationController?.sourceView = self.view
        
        present(menuViewController, animated: true, completion: nil)
    }
    
    func makeMenuViewController() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(identifier: "MenuViewController")
        viewController.modalPresentationStyle = .popover
        viewController.preferredContentSize = CGSize(width: 250, height: 250)
        return viewController
    }
    
}

extension ViewController: UIPopoverPresentationControllerDelegate {
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        .none
    }
}

