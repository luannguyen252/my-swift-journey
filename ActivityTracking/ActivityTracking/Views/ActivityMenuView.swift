//
//  ActivityMenuView.swift
//  ActivityTracking
//
//  Created by Luan Nguyen on 24/12/2020.
//

import SwiftUI

struct ActivityMenuView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var manager: ActivityManager
    
    // MARK: - BODY
    var body: some View {
        HStack {
            ForEach(manager.activities) { activity in
                ActivityMenuItemView(item: activity)
                    .onTapGesture {
                        withAnimation {
                            manager.selectActivity(item: activity)
                        }
                    }
            }
        } //: HSTACK
    }
}

// MARK: - ACTIVITY MENU ITEM
struct ActivityMenuItemView: View {
    // MARK: - PROPERTIES
    var item: ValueItem
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.appBlue, lineWidth: 2)
                .frame(height: 40)
                .opacity(item.selected ? 1.0 : 0.0)
            
            Text(item.title)
                .padding(16)
                .foregroundColor(item.selected ? Color.black : Color.gray)
        } //: ZSTACK
        .fixedSize()
    }
}
