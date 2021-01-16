//
//  ViewController.swift
//  Chapter09
//
//  Created by Jayant Varma on 19/12/19.
//  Copyright © 2019 Jayant Varma. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let sUIView = UIHostingController(rootView: CustomUIChild())
        sUIView.view.translatesAutoresizingMaskIntoConstraints = false
        sUIView.view.frame = self.view.frame
        self.addChild(sUIView)
        self.view.addSubview(sUIView.view)
    }


}

