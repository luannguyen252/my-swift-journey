//
//  CustomButtonView.swift
//  SwiftUIBook
//
//  Created by muukii on 2019/08/11.
//  Copyright © 2019 muukii. All rights reserved.
//

import SwiftUI

struct CustomButtonView: BookView {
  
  var body: some View {
    VStack {
      Button(action: {
        
      }) {
        Text("System Button")
      }
      CustomButton(title: "ABC")
      CustomButton(title: "ABC")
      CustomButton(title: "ABC")
    }
  }
}

struct CustomButton: View {
  
  let title: String
  
  var body: some View {
        
    ZStack {
      Text(title)
        .padding(EdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8))
    }
    
  }
}
