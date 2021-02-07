//
//  PopoverView.swift
//  PopoverPresentationController
//
//  Created by Arifin Firdaus on 05/10/20.
//  Copyright © 2020 Arifin Firdaus. All rights reserved.
//

import SwiftUI

struct PopoverView: View {
    @State private var showGreeting = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            HStack {
                Text("Fonts")
                Spacer()
                Text("SF Round")
            }
            HStack {
                Stepper(onIncrement: nil, onDecrement: nil) {
                    Text("Font Size")
                }
            }
            HStack {
                Stepper(onIncrement: nil, onDecrement: nil) {
                    Text("Line Height")
                }
            }
            HStack {
                Stepper(onIncrement: nil, onDecrement: nil) {
                    Text("Letter Spacing")
                }
            }
            HStack {
                Text("A")
                Text("B")
                Text("C")
                Text("D")
            }
            HStack {
                Toggle(isOn: $showGreeting) {
                    Text("Scrolling View")
                }
                .padding()
            }
        }.padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
}

struct PopoverView_Previews: PreviewProvider {
    static var previews: some View {
        PopoverView()
    }
}

class PopoverHostingController: UIHostingController<PopoverView> {
    
    required init?(coder: NSCoder) {
        super.init(coder: coder,rootView: PopoverView())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

