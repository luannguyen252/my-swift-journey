//
//  GridCellView.swift
//  AppStoreGrid
//
//  Created by Serafín Ennes Moscoso on 07/11/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct GridCellView: View {
    var app: Application

    var body: some View {
        print("Request App ---> " + app.id)
        return HStack {
            KFImage(app.thumbnailURL)
                .resizable()
                .frame(width: 80, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)

            VStack(alignment: .leading) {
                Text(app.name)
                    .bold()

                Text(app.subtitle)
                    .font(.footnote)
            }

            Spacer()

            Button(action: {}) {
                Text("   GET   ")
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .padding(4)
                    .background(Color(red: 238 / 255, green: 238 / 255, blue: 240 / 255))
                    .foregroundColor(.accentColor)
                    .cornerRadius(10)
            }
        }
    }
}

struct GridCellView_Previews: PreviewProvider {
    static var previews: some View {
        GridCellView(app: app1)
    }
}
