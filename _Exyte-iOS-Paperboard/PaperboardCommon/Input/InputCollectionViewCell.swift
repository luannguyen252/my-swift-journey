//
//  InputCollectionViewCell.swift
//  Paperboard
//
//  Created by Andrey Tchernov on 16.08.2018.
//  Copyright © 2018 Ice Rock. All rights reserved.
//

import UIKit

class InputCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var characterButton: KeyboardButton!
    var onButtonPressed: (() -> Void)?
    
    func fill(with value: String) {
        UIView.performWithoutAnimation {
            characterButton.setTitle(value, for: UIControl.State.normal)
            characterButton.layoutIfNeeded()
        }
    }
    
    @IBAction func onPressed(_ sender: Any) {
        onButtonPressed?()
    }
}
