//
//  ViewController.swift
//  SwiftUIKit
//
//  Created by Gualtiero Frigerio on 26/03/2020.
//  Copyright © 2020 Gualtiero Frigerio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let redLine = true
        
        let names = ["John", "Paul", "Luke"]
        
        let containerView = HStack {
            ForEach(names) { name in
                VStack {
                    Text("hello \(name)")
                        .modifier(SwiftUIKitFontModifier(UIFont.systemFont(ofSize: 30)))
                        .background(.yellow)
                    if redLine {
                        Text("second line is red")
                            .font(UIFont.systemFont(ofSize: 8))
                            .background(.red)
                    }
                    else {
                        Text("second line is green").background(.green)
                    }
                }
                if redLine {
                    Text("red red liiiine").background(.red)
                }
            }
        }
        .frame(self.view.frame)
        
        
         let containerView2 = HStack {
            Text("hi there!")
                .font(UIFont.systemFont(ofSize: 30))
                .frame(CGRect(x:0, y:0, width:100, height:100))
                .background(.cyan)
            Rectangle()
                .background(.red)
            Circle(fillColor: .yellow)
                .frame(CGRect(x: 0, y: 0, width: 100, height: 100))
        }.frame(self.view.frame)
        

        if let view = containerView.uiView {
            self.view.addSubview(view)
        }
        
        if let view2 = containerView2.uiView {
            self.view.addSubview(view2)
        }
    }


}

