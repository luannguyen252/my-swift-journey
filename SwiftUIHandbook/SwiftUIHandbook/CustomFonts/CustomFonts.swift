//
//  CustomFonts1.swift
//  SwiftUIHandbook
//
//  Created by Luan Nguyen on 14/12/2020.
//

import SwiftUI

struct CustomFonts: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("This is Georgia font")
                .font(.custom("Georgia", size: 24))
            
            Text("This is TTFirsNeue Black font")
                .font(.custom("TTFirsNeue-Black", size: 24))
            
            Text("This is TTFirsNeue Bold font")
                .font(.custom("TTFirsNeue-Bold", size: 24))
            
            Text("This is TTFirsNeue Medium font")
                .font(.custom("TTFirsNeue-Medium", size: 24))
            
            Text("This is TTFirsNeue Regular font")
                .font(.custom("TTFirsNeue-Regular", size: 24))
        }
    }
}

struct CustomFonts_Previews: PreviewProvider {
    static var previews: some View {
        CustomFonts()
    }
}
