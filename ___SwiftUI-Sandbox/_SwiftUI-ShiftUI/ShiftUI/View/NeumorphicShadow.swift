//
//  NeumorphicShadow.swift
//  ShiftUI
//
//  Created by Zoha on 2/20/21.
//

import SwiftUI

extension Shape {
  func neumorphicShadow(color: Color = .offWhite, height: CGFloat = 5) -> some View {
    self
      .fill(color)
      .overlay(
          ZStack {
            self
              .stroke(Color.black.opacity(0.43), lineWidth: height.magnitude)
              .blur(radius: height.magnitude)
              .offset(x: -height / 2, y: -height / 2)
              .mask(
                self
                  .fill(LinearGradient(Color.black, Color.clear))
              )
            
            self
              .stroke(Color.white, lineWidth: height.magnitude * 2)
              .blur(radius: height.magnitude)
              .offset(x: height / 2, y: height / 2)
              .mask(
                self
                  .fill(LinearGradient(Color.clear, Color.black))
              )
          }
          .opacity(height < 0 ? 1 : 0)
      )
      .shadow(color: Color.black.opacity(0.2).opacity(height >= 0 ? 1 : 0), radius: height.magnitude, x: height, y: height)
      .shadow(color: Color.white.opacity(0.7).opacity(height >= 0 ? 1 : 0), radius: height.magnitude, x: -height, y: -height)
  }
  
  func neumorphic(for isPressed: Bool) -> some View {
    self
      .neumorphicShadow(height: isPressed ? -4 : 5)
  }
}

extension View {
  func neumorphicShadow(height: CGFloat = 5) -> some View {
    self
      .overlay(
        ZStack {
          Color.black.opacity(0.1)
            .mask(
              Color.white
                .overlay(
                  Color.black
                    .mask(
                      self
                        .offset(x: -height * 1.5, y: -height * 1.5)
                        .blur(radius: height.magnitude)
                    )
                )
                .drawingGroup()
                .luminanceToAlpha()
            )
            .blendMode(.darken)
          
          Color.white.opacity(0.4)
            .mask(
              Color.white
                .overlay(
                  Color.black
                    .mask(
                      self
                        .offset(x: height * 1.5, y: height * 1.5)
                        .blur(radius: height.magnitude)
                    )
                )
                .drawingGroup()
                .luminanceToAlpha()
            )
            .blendMode(.screen)
        }
        .mask(self)
        .opacity(height < 0 ? 1 : 0)
      )
      .shadow(color: Color.black.opacity(0.2).opacity(height >= 0 ? 1 : 0), radius: height.magnitude, x: height, y: height)
      .shadow(color: Color.white.opacity(0.7).opacity(height >= 0 ? 1 : 0), radius: height.magnitude, x: -height, y: -height)
  }
}

struct NeumorphicShadow_Previews: PreviewProvider {
  struct PreviewData: View {
    @State private var height: CGFloat = 0
    
    var body: some View {
      VStack {
        ZStack {
          Capsule()
            .fill(Color.offWhite)
            .frame(width: 50)
          
          Capsule()
            .fill(Color.offWhite)
            .frame(height: 50)
        }
        .clipped()
        .neumorphicShadow(height: height)
        .padding(50)
          
        
        Text("Hello World")
          .font(.system(size: 60))
          .bold()
          .foregroundColor(Color.offWhite)
          .neumorphicShadow(height: height / 4)
        
        Image(systemName: "hand.thumbsup.fill")
          .font(.system(size: 60))
          .foregroundColor(.offWhite)
          .neumorphicShadow(height: height / 4)
        
        Circle()
          .neumorphicShadow(height: height)
          .padding(50)
        
        Slider(value: $height, in: -20...20)
          .padding()
      }
      .background(Color.offWhite.edgesIgnoringSafeArea(.all))
    }
  }
  
  static var previews: some View {
    PreviewData()
  }
}

