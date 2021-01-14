//
//  ViewController.swift
//  Basic_SwiftUIKit_Examples
//
//  Created by Zach Eriksen on 1/31/20.
//  Copyright © 2020 oneleif. All rights reserved.
//

import UIKit
import SwiftUIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Navigate.shared.configure(controller: navigationController)
            .set(title: "Hello World")
            .setRight(barButton: BarButton {
                Button("Alert") {
                    Navigate.shared.alert(title: "Some Alert!",
                                          message: "Some Message!!",
                                          withActions: [.cancel],
                                          secondsToPersist: 3)
                }
            })
            .setLeft(barButton: BarButton {
                Button("Toast") {
                    Navigate.shared.toast(style: .info,
                               pinToTop: true,
                               secondsToPersist: 5) {
                            Label.title1("Welcome To SwiftUIKit!")
                    }
                }
            })
            
        
        let someViewController = UIViewController {
            View(backgroundColor: .white) {
                Label.title1("Hello World!")
            }
        }
        
        let field = Field(value: "Current Value", placeholder: "Enter a Value", keyboardType: .default)
            .inputHandler { value in
                print("You entered: \(value)")
        }
        
        let multiLineField = MultiLineField(value: "I have some value", keyboardType: .default)
            .inputHandler { (value) in
                print(value)
        }
        
        view.embed {
            SafeAreaView {
                Table(defaultCellHeight: 88) {
                    [
                        // MARK: Button Example
                        Button("Say Hello") {
                            print("Hello! 👋")
                        },
                        
                        // MARK: Divider Example
                        HStack(withSpacing: 8) {
                            [
                                Label("Amount Left"),
                                Divider(.vertical),
                                Spacer(),
                                Label("4")
                            ]
                        },
                        
                        // MARK: Field Example
                        HStack {
                            [
                                field,
                                Button("Save") {
                                    field.resignFirstResponder()
                                }
                                .frame(width: 60)
                            ]
                        },
                        
                        // MARK: Image Example
                        HStack(distribution: .fillEqually) {
                            [
                                Image(.blue),
                                Image(.green),
                                Image(.red)
                            ]
                        },
                        
                        // MARK: LoadingImage Example
                        LoadingImage(URL(string: "https://github.com/zmeriksen/SwiftUIKit/blob/master/assets/SwiftUIKit_logo_v1.png?raw=true")!)
                            .contentMode(.scaleAspectFit),
                        
                        // MARK: LoadingView Example
                        LoadingView(forStyle: .large).start(),
                        
                        
                        // MARK: MultiLineField Example
                        HStack {
                            [
                                multiLineField,
                                Button("Save") {
                                    field.resignFirstResponder()
                                }
                                .frame(width: 60)
                            ]
                        },
                        
                        // MARK: NavButton Example
                        NavButton("Navigate to SomeVC",
                                  destination: someViewController,
                                  style: .push),
                        
                        
                        // MARK: ScrollView Example
                        ScrollView {
                            View(backgroundColor: .systemOrange)
                                .frame(height: 44, width: 1000)
                        },
                        
                        // MARK: Slider Example
                        Slider(value: 0.5, from: 0, to: 1) { value in
                            print("Value is \(value)")
                        },
                        
                        // MARK: Spacer Example
                        HStack {
                            [
                                Image(.brown).frame(width: 60),
                                Spacer(),
                                Image(.brown).frame(width: 60)
                            ]
                        },
                        
                        // MARK: Switch Example
                        Switch(isOn: false) { value in
                            print("Value is \(value)")
                        },
                        
                        
                        // MARK: WebView Example
                        WebView(url: URL(string: "https://github.com/oneleif")!),
                        
                    ]
                }
            }
        }
    }
}


