//
//  RRLoader.swift
//  RRSwiftUIAPICalling
//
//  Created by Rahul Mayani on 09/07/20.
//  Copyright © 2020 RR. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import UIKit

private let vLoader = UIView()

private let activityIndicatorView = NVActivityIndicatorView(frame: CGRect.init(x: 0,y: 0,width: 50,height: 50), type: .ballRotateChase, color: UIColor.blue, padding: CGFloat(0))
//private let activityIndicatorView = UIActivityIndicatorView.init(style: .whiteLarge)

struct RRLoader {
    
    static func startLoaderToAnimating(_ isMask: Bool = true)  {
        
        DispatchQueue.main.async {
            if isMask {
                vLoader.frame = UIScreen.main.bounds
                vLoader.backgroundColor = UIColor.black.withAlphaComponent(0.2)
                sceneDelegate.window?.addSubview(vLoader)
            }
            
            //activityIndicatorView.color = UIColor.blue
            //activityIndicatorView.hidesWhenStopped = true
            activityIndicatorView.center = CGPoint(x: UIScreen.main.bounds.size.width*0.5, y: UIScreen.main.bounds.size.height*0.5)
            sceneDelegate.window?.addSubview(activityIndicatorView)
            
            //UIApplication.shared.isNetworkActivityIndicatorVisible = true
            activityIndicatorView.startAnimating()
        }
    }
    
    static func stopLoaderToAnimating() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            //UIApplication.shared.isNetworkActivityIndicatorVisible = false
            activityIndicatorView.stopAnimating()
            vLoader.removeFromSuperview()
        }
    }
}
