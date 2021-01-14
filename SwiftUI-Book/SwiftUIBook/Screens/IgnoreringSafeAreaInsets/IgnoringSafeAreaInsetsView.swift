//
//  IgnoringSafeAreaInsetsView.swift
//  SwiftUIBook
//
//  Created by muukii on 2019/09/15.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

struct IgnoringSafeAreaInsetsView: BookView {
  
  var body: some View {
    
    Color(.systemOrange)
      .edgesIgnoringSafeArea(.all)
    
  }
}
