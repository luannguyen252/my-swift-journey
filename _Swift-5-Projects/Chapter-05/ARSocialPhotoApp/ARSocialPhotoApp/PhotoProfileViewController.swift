//
//  PhotoProfileViewController.swift
//  SocialPhotoApp
//
//  Created by sergio on 22/04/2019.
//  Copyright © 2019 PacktPublishing. All rights reserved.
//

import UIKit
import FirebaseUI

class PhotoProfileViewController: UIViewController, FUIAuthDelegate {

    @IBOutlet weak var signInOutButton: UIBarButtonItem!
    @IBOutlet weak var signedStatusLabel: UILabel!
    @IBOutlet weak var signedInUserLabel: UILabel!
    
    var authUI: FUIAuth?
    fileprivate var authStateDidChangeHandle: AuthStateDidChangeListenerHandle?
    fileprivate var auth = Auth.auth()

    ////////////////////////////////////////////////////////
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.isToolbarHidden = false;
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.isToolbarHidden = true;
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        authUI = FUIAuth.defaultAuthUI()
        authUI!.delegate = self
        
        self.authStateDidChangeHandle =
            self.auth.addStateDidChangeListener(self.updateUI(auth:user:))
    }
    
    deinit {
        if let handle = self.authStateDidChangeHandle {
            self.auth.removeStateDidChangeListener(handle)
        }
    }
    
    private func attemptSignIn() {
        
        let providers: [FUIAuthProvider] = [FUIGoogleAuth()]
        authUI!.providers = providers
        self.present(authUI!.authViewController(),
                     animated: true,
                     completion: nil)
    }
    
    @IBAction func onSignInOut(_ sender: Any) {
        
        if self.auth.currentUser != nil {
            try? self.authUI?.signOut()
        } else {
            attemptSignIn()
        }
    }
    
    /////////////////////////////////////////////////////////
    // This is called when the user changes their sign-in state
    func updateUI(auth: Auth, user: User?) {
        
        if let user = self.auth.currentUser {
            
            if !user.isAnonymous {
                signedStatusLabel.text = "You are currently signed in as:"
                signedInUserLabel.text = "\(user.displayName ?? "Unknown") (\(user.uid))"
                signInOutButton.title = "Sign out"
            
            } else {

                signedStatusLabel.text = "You are not currently signed in."
                signedInUserLabel.text = "(Anonynous user: \(user.uid)"
                signInOutButton.title = "Sign in"
            }
            
        } else {
            
            attemptSignIn()
        }
    }
    
    // This is called when the user signs in or taps Cancel
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        
        if error == nil {
            // signed-in: jump to first tab after successful sign in
            self.tabBarController?.selectedIndex = 0
        } else {
            // not signed-in: attempt anonymous login
            auth.signInAnonymously() { (authResult, error) in
                if error == nil {
                    // jump to first tab
                    self.tabBarController?.selectedIndex = 0
                }
            }
        }
    }
    
    // This is requried by Google, Facebook, etc. sign-in
    internal func application(_ app: UIApplication,
                              open url: URL,
                              options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
        
        let sourceApplication = options[UIApplication.OpenURLOptionsKey.sourceApplication] as! String?
        if FUIAuth.defaultAuthUI()?.handleOpen(url, sourceApplication: sourceApplication) ?? false {
            return true
        }
        // other URL handling goes here.
        return false
    }

}
