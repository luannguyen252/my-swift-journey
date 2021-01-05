//
//  ViewController.swift
//  CombineUIKit
//
//  Created by Philipp Baldauf on 04.03.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    
    private let takenUsernames = ["Philipp", "John", "Kathrin"]

    @IBOutlet weak var usernameStatusLabel: UILabel!
    @IBOutlet weak var passwordStatusLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    var bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField
            .rx
            .text
            .compactMap { $0 }
            .map { !self.takenUsernames.contains($0) }
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                self.usernameStatusLabel.isHidden = event.element == true
            }.disposed(by: bag)
    }

    @IBAction func editingChanged(_ textField: UITextField) {
    }
    
}

