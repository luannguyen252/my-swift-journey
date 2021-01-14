//
//  GridView.swift
//  AppStoreGrid
//
//  Created by Serafín Ennes Moscoso on 07/11/2020.
//

import SwiftUI
import KingfisherSwiftUI

struct GridView: View {

    var vm = GridVM()

    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Text("Apps")
                        .font(.title)
                        .bold()
                        .padding()
                    Spacer()
                }

                // Main stack
                ForEach(vm.allCategories, id: \.self) { category in
                    LazyVStack {
                        Divider()
                            .padding([.leading, .trailing])

                        HStack {
                            Text(category)
                                .font(.title3)
                                .bold()
                            Spacer()
                        }
                        .padding([.leading])

                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyHStack {
                                Spacer()
                                    .frame(width: 5, height: 80)
                                ForEach(vm.app(for: category)) { app in
                                    GridCellView(app: app)
                                        .frame(width: 325, height: 100)
                                        .padding(.horizontal, 5)
                                }
                            }
                        }.padding([.bottom], 15)
                    }
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView()
            .previewDevice("iPhone 11")
    }
}
