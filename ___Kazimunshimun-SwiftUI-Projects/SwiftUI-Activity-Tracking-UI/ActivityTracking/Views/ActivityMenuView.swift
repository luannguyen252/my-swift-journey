//
//  ActivityMenuView.swift
//  ActivityTracking
//
//  Created by Anik on 14/11/20.
//

import SwiftUI

struct ActivityMenuView: View {
    @EnvironmentObject var manager: ActivityManager
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
        }
    }
}

struct ActivityMenuItemView: View {
    var item: ValueItem
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(Color.appBlue, lineWidth: 2)
                .frame(height: 40)
                .opacity(item.selected ? 1.0 : 0.0)
            
            Text(item.title)
                .padding(16)
                .foregroundColor(item.selected ? Color.black : Color.gray)
        }
        .fixedSize()
    }
}
