//
//  CardMenu.swift
//  SwiftUIBankCardAnimation2
//
//  Created by Luan Nguyen on 03/01/2021.
//

import SwiftUI

// Hardcoded simple three buttons card actions menu
struct CardMenu: View {
    // MARK: - SET SIZE
    let size: CGFloat
    
    // MARK: - BODY
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "lock")
                .font(.system(size: 30.0))
                .foregroundColor(Color.white)
                .frame(width: size, height: size)
            
            Image(systemName: "pencil.and.ellipsis.rectangle")
                .font(.system(size: 30.0))
                .foregroundColor(Color.white)
                .frame(width: size, height: size)
            
            Image(systemName: "slider.horizontal.3")
                .font(.system(size: 30.0))
                .foregroundColor(Color.white)
                .frame(width: size, height: size)
        } //: VSTACK
        .background(Color(#colorLiteral(red: 0.1803921569, green: 0.2, blue: 0.2352941176, alpha: 1)))
        .cornerRadius(8)
    }
    
}

// MARK: - PREVIEW
#if DEBUG
struct CardMenu_Previews: PreviewProvider {
    static var previews: some View {
        CardMenu(size: 66)
    }
}
#endif
