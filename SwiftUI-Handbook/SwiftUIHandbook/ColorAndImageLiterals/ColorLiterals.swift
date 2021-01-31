//
//  ColorAndImageLiterals.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 15/12/2020.
//

import SwiftUI

struct ColorLiterals: View {
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 16) {
            Text("Color Literal 100%")
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)))
            
            Text("Color Literal 80%")
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.8)))
            
            Text("Color Literal 60%")
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.6)))
            
            Text("Color Literal 40%")
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.4)))
            
            Text("Color Literal 20%")
                .foregroundColor(Color(#colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 0.2)))
        }
    }
}

// MARK: - PREVIEW
struct ColorLiterals_Previews: PreviewProvider {
    static var previews: some View {
        ColorLiterals()
    }
}
