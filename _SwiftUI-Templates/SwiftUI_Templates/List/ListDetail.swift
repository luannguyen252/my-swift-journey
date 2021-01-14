//
//  ListDetail.swift
//  SwiftUI_Templates
//
//  Created by Hui, Malachi | DCMS on 2020/05/04.
//  Copyright © 2020 Hui, Malachi | DCMS. All rights reserved.
//

import SwiftUI

struct ListDetail: View {
    var update: ListModel = listData[0]
    
    var body: some View {
        List {
            VStack {
                Image(update.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                Text(update.text)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .navigationBarTitle(update.title)
        }
        .listStyle(GroupedListStyle())
    }
}

struct ListDetail_Previews: PreviewProvider {
    static var previews: some View {
        ListDetail()
    }
}
