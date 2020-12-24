//
//  MenuView.swift
//  CaloryApp
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct MenuView: View {
    // MARK: - PROPERTIES
    let width: CGFloat
    @ObservedObject var menuViewModel: MenuViewModel
    
    // MARK: - BODY
    var body: some View {
        VStack() {
            ZStack(alignment: .bottom) {
                Rectangle()
                    .frame(width: width - 60, height: 90)
                    .foregroundColor(.clear)
                
                RoundedRectangle(cornerRadius: 33)
                    .frame(width: width - 60,height: 65)
                    .foregroundColor(.white)
                
                HStack {
                    Spacer()
                    
                    Menu(menuItem: self.menuViewModel.menus[0]).onTapGesture {
                        withAnimation(.linear(duration: 0.8)) {
                            self.menuViewModel.selectMenu(index: 0)
                        }
                    }
                    
                    Spacer()
                    
                    Menu(menuItem: self.menuViewModel.menus[1]).onTapGesture {
                        withAnimation(.linear(duration: 0.8)) {
                            self.menuViewModel.selectMenu(index: 1)
                        }
                    }
                    
                    Spacer()
                    
                    Menu(menuItem: self.menuViewModel.menus[2]).onTapGesture {
                        withAnimation(.linear(duration: 0.8)) {
                            self.menuViewModel.selectMenu(index: 2)
                        }
                    }
                    
                    Spacer()
                } //: HSTACK
            } //: ZSTACK
        } //: VSTACK
    }
}

// MARK: - PREVIEW
#if DEBUG
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(width: 375, menuViewModel: MenuViewModel())
    }
}
#endif
