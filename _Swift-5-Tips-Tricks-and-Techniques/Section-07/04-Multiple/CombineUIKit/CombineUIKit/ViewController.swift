//
//  ViewController.swift
//  CombineUIKit
//
//  Created by Philipp Baldauf on 04.03.20.
//  Copyright © 2020 Philipp Baldauf. All rights reserved.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    private let takenUsernames = ["Philipp", "John", "Kathrin"]

    @IBOutlet weak var usernameStatusLabel: UILabel!
    @IBOutlet weak var passwordStatusLabel: UILabel!
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    @Published var username: String = ""
    @Published var password: String = ""
    
    var isUsernameValid: AnyPublisher<Bool, Never> {
        $username
            .map { !self.takenUsernames.contains($0) }
            .eraseToAnyPublisher()
    }
    
    var isPasswordValid: AnyPublisher<Bool, Never> {
        $password
            .map { $0.count > 6 }
            .eraseToAnyPublisher()
    }
    
    var canRegister: AnyPublisher<Bool, Never> {
        return Publishers.CombineLatest(isUsernameValid, isPasswordValid)
            .map { $0 && $1 }
            .eraseToAnyPublisher()
    }
    
    private var cancellables: [AnyCancellable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usernameStatusLabel.isHidden = true
        passwordStatusLabel.isHidden = true
        registerButton.isEnabled = false
        
        isUsernameValid
            .receive(on: RunLoop.main)
            .assign(to: \.isHidden, on: usernameStatusLabel)
            .store(in: &cancellables)
        
        isPasswordValid
            .receive(on: RunLoop.main)
            .assign(to: \.isHidden, on: passwordStatusLabel)
            .store(in: &cancellables)
        
        canRegister
            .receive(on: RunLoop.main)
            .assign(to: \.isEnabled, on: registerButton)
            .store(in: &cancellables)
    }

    @IBAction func editingChanged(_ textField: UITextField) {
        switch textField {
        case usernameTextField:
            username = textField.text ?? ""
        case passwordTextField:
            password = textField.text ?? ""
        default:
            break
        }
    }
    
}

