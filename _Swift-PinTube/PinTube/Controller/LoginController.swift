//
//  LoginController.swift
//  PinTube
//
//  Created by Daval Cato on 8/25/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit
import Firebase
import LocalAuthentication
//import GoogleSignIn

class LoginController: UIViewController, UITextFieldDelegate {
    
    
    // MARK: - Properties
    
    let logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = #imageLiteral(resourceName: "logo")
        return iv
    }()
    
    lazy var emailContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_mail_outline_white_2x"), emailTextField)
    }()
    
    lazy var passwordContainerView: UIView = {
        let view = UIView()
        return view.textContainerView(view: view, #imageLiteral(resourceName: "ic_lock_outline_white_2x"), passwordTextField)
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Email", isSecureTextEntry: false)
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceolder: "Password", isSecureTextEntry: true)
    }()
    
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("LOG IN", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(UIColor.mainBlue(), for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        button.layer.cornerRadius = 5
        return button
    }()
    
    lazy var dividerView: UIView = {
        let dividerView = UIView()
        
        let label = UILabel()
        label.text = "OR"
        label.textColor = UIColor(white: 1, alpha: 0.88)
        label.font = UIFont.systemFont(ofSize: 14)
        dividerView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: dividerView.centerXAnchor).isActive = true
        
        let separator1 = UIView()
        separator1.backgroundColor = UIColor(white: 1, alpha: 0.88)
        dividerView.addSubview(separator1)
        separator1.anchor(top: nil, left: dividerView.leftAnchor, bottom: nil, right: label.leftAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1.0)
        separator1.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor).isActive = true
        
        let separator2 = UIView()
        separator2.backgroundColor = UIColor(white: 1, alpha: 0.88)
        dividerView.addSubview(separator2)
        separator2.anchor(top: nil, left: label.rightAnchor, bottom: nil, right: dividerView.rightAnchor, paddingTop: 0, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 1.0)
        separator2.centerYAnchor.constraint(equalTo: dividerView.centerYAnchor).isActive = true
        
        return dividerView
    }()
    
//    let googleLoginButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.layer.cornerRadius = 5
//        button.setTitle("Sign In with Google", for: .normal)
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
//        button.backgroundColor = .googleRed()
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(handleGoogleSignIn), for: .touchUpInside)
//        return button
//    }()
    
    let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white])
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.white]))
        button.setAttributedTitle(attributedTitle, for: .normal)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    var context = LAContext()
    
    // MARK: - Init
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context.localizedCancelTitle = "End session"
        context.localizedFallbackTitle = "Fallback!"
        if #available(iOS 11.0, *) {
            context.localizedReason = "This app needs your authentication."
            context.touchIDAuthenticationAllowableReuseDuration = LATouchIDAuthenticationMaximumAllowableReuseDuration
        } else {
            // Fallback on earlier versions
        }
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        configureViewComponents()
        hideKeyboardWhenTappedAround()
        observeKeyboardNotification()
        evaluatePolicy()
        
    }
    
    func evaluatePolicy() {
        var errorCanEval: NSError?
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &errorCanEval) {
            
            if #available(iOS 11.0, *) {
                switch context.biometryType {
                case .faceID:
                    print("face")
                case .touchID:
                    print("touch")
                case .none:
                    print("none")
                @unknown default:
                    print("unknown")
                    
                }
                
            } else {
                // Fallback on earlier versions
                print("can't evaluate")

                
            }
            
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Fall back title - override reason") { (success, error) in
                print(success)
                if let err = error {
                    let evalErrCode = LAError(_nsError: err as NSError)
                    switch evalErrCode.code {
                    case LAError.Code.userCancel:
                        print("user cancelled")
                    case LAError.appCancel:
                        print("app cancelled")
                    case LAError.Code.userFallback:
                        print("fallback")
                        self.promptForCode()
                    case LAError.Code.authenticationFailed:
                        print("failed")
                    default:
                        print("other error")
                        
                        
                    }
                    
                }
                
            }
//            Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (t) in
//                self.context.invalidate()
//            }
            
        }
        else {
            
            print("can't evaluate")
            print(errorCanEval?.localizedDescription ?? "no error description")
            
            if let err = errorCanEval {
                let evalErrCode = LAError(_nsError: err as NSError)
                switch evalErrCode.code {
                case LAError.Code.biometryNotEnrolled:
                    print("not enrolled")
                case LAError.Code.userFallback:
                    print("fallback")
                case LAError.Code.authenticationFailed:
                    print("failed")
                default:
                    print("other error")
                    
                    
                }
                
            }
            
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        GIDSignIn.sharedInstance()?.uiDelegate = self
//        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let nextTag = textField.tag + 1
        
        if let nextResponder = textField.superview?.viewWithTag(nextTag) {
            nextResponder.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    
    // MARK: - Selectors
    
//    @objc func handleGoogleSignIn() {
//        GIDSignIn.sharedInstance()?.signIn()
//    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        logUserIn(withEmail: email, password: password)
    }
    
    @objc func handleShowSignUp() {
        navigationController?.pushViewController(SignUpController(), animated: true)
    }
    
    fileprivate func observeKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardHide),name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardShow() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: -75, width: self.view.frame.width, height: self.view.frame.height)
            
            
        }, completion: nil)
       
    }
    
    @objc func keyboardHide() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
            self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
            
        }, completion: nil)
        
    }
    
    func promptForCode() {
        let ac = UIAlertController(title: "Enter Code", message: "Enter your user code.", preferredStyle: .alert)
        
        ac.addTextField { (tf) in
            tf.placeholder = "Enter User Code"
            tf.keyboardType = .numberPad
            tf.isSecureTextEntry = true
        }
        
        ac.addAction(UIAlertAction(title: "OK", style: .default, handler: { (aa) in
            print(ac.textFields?.first?.text ?? "no value")
        }))
        
        self.present(ac, animated: true, completion: nil)
        
    }
    
    // MARK: - API
    
    func logUserIn(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if let error = error {
                print("Failed to sign user in with error: ", error.localizedDescription)
                return
            }
            
            print("Successfully logged in..")
            
            guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
            guard navController.viewControllers[0] is HomeController else { return }
//            controller.configureViewComponents()
            
//             forgot to add this in video
//            controller.loadUserData()
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    // MARK: - Helper Functions
    
    func configureViewComponents() {
        view.backgroundColor = UIColor.mainBlue()
        navigationController?.navigationBar.isHidden = true
        
        view.addSubview(logoImageView)
        logoImageView.anchor(top: view.topAnchor, left: nil, bottom: nil, right: nil, paddingTop: 60, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 150, height: 150)
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(emailContainerView)
        emailContainerView.anchor(top: logoImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(passwordContainerView)
        passwordContainerView.anchor(top: emailContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 16, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(loginButton)
        loginButton.anchor(top: passwordContainerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(dividerView)
        dividerView.anchor(top: loginButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
//        view.addSubview(googleLoginButton)
//        googleLoginButton.anchor(top: dividerView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 24, paddingLeft: 32, paddingBottom: 0, paddingRight: 32, width: 0, height: 50)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 32, paddingBottom: 12, paddingRight: 32, width: 0, height: 50)
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}










//extension LoginController: GIDSignInDelegate {
//    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
//
//        if let error = error {
//            print("Failed to sign in with error:", error)
//            return
//        }
//
//        guard let authentication = user.authentication else { return }
//        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
//
//        Auth.auth().signInAndRetrieveData(with: credential) { (result, error) in
//
//            if let error = error {
//                print("Failed to sign in and retrieve data with error:", error)
//                return
//            }
//
//            guard let uid = result?.user.uid else { return }
//            guard let email = result?.user.email else { return }
//            guard let username = result?.user.displayName else { return }
//
//            let values = ["email": email, "username": username]
//
//            Database.database().reference().child("users").child(uid).updateChildValues(values, withCompletionBlock: { (error, ref) in
//                guard let navController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController else { return }
//                guard let controller = navController.viewControllers[0] as? HomeController else { return }
//                controller.configureViewComponents()
//
//                // forgot to add this in video
//                controller.loadUserData()
//
//                self.dismiss(animated: true, completion: nil)
//            })
//        }
//    }
//}













