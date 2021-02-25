//
//  AccountCreationViewModel.swift
//  Dating App
//
//  Created by Balaji on 10/12/20.
//

import SwiftUI
import Firebase
import CoreLocation

// Getting user Location....

class AccountCreationViewModel: NSObject,ObservableObject,CLLocationManagerDelegate{

    // User Details...
    @Published var name = ""
    @Published var bio = ""
    @Published var age = ""
    @Published var location = ""
    
    // Login Details...
    @Published var phNumber = ""
    @Published var code = ""
    
    // refrence For View Changing
    // ie Login To Register to Image Uplaod
    @Published var pageNumber = 0
    
    // Images....
    @Published var images = Array(repeating: Data(count: 0), count: 4)
    @Published var picker = false
    
    // AlertView Details...
    @Published var alert = false
    @Published var alertMsg = ""
    
    // Loading Screen...
    @Published var isLoading = false
    
    // OTP Credentials...
    @Published var CODE = ""
    
    // Status...
    @AppStorage("log_Status") var status = false
    
    func login(){
        
        // Getting OTP...
        // Disabling App Verification...
        // Undo it while testing with live Phone....
        Auth.auth().settings?.isAppVerificationDisabledForTesting = true
        
        isLoading.toggle()
        
        PhoneAuthProvider.provider().verifyPhoneNumber("+" + code + phNumber, uiDelegate: nil) { (CODE, err) in
            
            self.isLoading.toggle()
            
            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            self.CODE = CODE!
            
            // Alert TextFields...
            
            let alertView = UIAlertController(title: "Verification", message: "Enter OTP Code", preferredStyle: .alert)
            
            let cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            
            let ok = UIAlertAction(title: "Ok", style: .default) { (_) in
                
                // Verifying OTP
                if let otp = alertView.textFields![0].text{
                    
                    let credential = PhoneAuthProvider.provider().credential(withVerificationID: self.CODE, verificationCode: otp)
                    
                    self.isLoading.toggle()
                    
                    Auth.auth().signIn(with: credential) { (res, err) in
                        
                        if err != nil{
                            self.alertMsg = err!.localizedDescription
                            self.alert.toggle()
                            self.isLoading.toggle()
                            return
                        }
                        
                        // Go To Register Screen....
                        withAnimation{
                            self.pageNumber = 1
                        }
                        
                        self.isLoading.toggle()
                    }
                }
            }
            
            alertView.addTextField { (txt) in
                txt.placeholder = "1234"
            }
            
            alertView.addAction(cancel)
            alertView.addAction(ok)
            
            // Presentitng...
            UIApplication.shared.windows.first?.rootViewController?.present(alertView, animated: true, completion: nil)
        }
    }
    
    func signUp(){
        
        let storage = Storage.storage().reference()
        
        let ref = storage.child("profile_Pics").child(Auth.auth().currentUser!.uid)
        
        // Image urls...
        var urls : [String] = []
        
        isLoading.toggle()
        
        for index in images.indices{
                        
            ref.child("img\(index)").putData(images[index], metadata: nil) { (_, err) in
                                
                if err != nil{
                    self.alertMsg = err!.localizedDescription
                    self.alert.toggle()
                    self.isLoading.toggle()
                    return
                }
                
                ref.child("img\(index)").downloadURL { (url, _) in
                    guard let imageUrl = url else{return}
                    
                    //appdending urls...
                    urls.append("\(imageUrl)")
                    
                    // checking all images are uploaded...
                    if urls.count == self.images.count{
                        
                        // Update DB...
                        self.RegisterUser(urls: urls)
                    }
                }
                
            }
        }
    }
    
    func RegisterUser(urls: [String]){
        
        let db = Firestore.firestore()
        
        db.collection("Users").document(Auth.auth().currentUser!.uid).setData([
        
            "userName": self.name,
            "bio": self.bio,
            "location": self.location,
            "age": self.age,
            "imageUrls": urls
            
        ]) { (err) in
            
            self.isLoading.toggle()
            
            if err != nil{
                self.alertMsg = err!.localizedDescription
                self.alert.toggle()
                return
            }
            
            // Success..
            self.status = true
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let last = locations.last!
        
        CLGeocoder().reverseGeocodeLocation(last) { (places, _) in
            guard let placeMarks = places else{return}
            
            self.location = (placeMarks.first?.name ?? "") + ", " + (placeMarks.first?.locality ?? "")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        // DO Something...
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        if manager.authorizationStatus == .authorizedWhenInUse{
            manager.requestLocation()
        }
    }
}

