//
//  DropdownView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct DropdownView: View {
    @StateObject var dropdownManager = DropdownManager()
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.dropDown)
                .frame(height: dropdownManager.expanded ? 300 : 60)
            
            HStack(alignment: .top) {
                if !dropdownManager.expanded {
                    RegionItemView(region: dropdownManager.regions[dropdownManager.selectedIndex])
                        .onTapGesture {
                            withAnimation { dropdownManager.expandCollapseView() }
                        }
                } else {
                    VStack(spacing: 0) {
                        ForEach(dropdownManager.regions) { region in
                            RegionItemView(region: region)
                                .onTapGesture {
                                    withAnimation { dropdownManager.selectItem(region: region) }
                                }
                        }
                    }
                }
                
                Image(systemName: "chevron.down")
                    .font(.system(size: 18, weight: .bold))
                    .foregroundColor(.white)
                    .rotationEffect(dropdownManager.expanded ? .degrees(180) : .zero)
                    .padding()
                    .padding(.top, 10)
                    .onTapGesture {
                        withAnimation { dropdownManager.expandCollapseView() }
                    }
            }
        }
    }
}

struct DropdownView_Previews: PreviewProvider {
    static var previews: some View {
        DropdownView()
    }
}
