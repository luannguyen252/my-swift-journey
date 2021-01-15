//
//  CheeseListView.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Combine
import SwiftUI

struct CheeseListView: View {
    @ObservedObject var viewModel: CheeseListViewModel

    var body: some View {
        Group {
            List(viewModel.cheeses) { cheese in
                Button(action: {
                    self.viewModel.delegate?.showDetail(cheese: cheese)
                }, label: {
                    CheeseCellView(cheese: cheese)
                })
            }
        }
        .navigationBarTitle("CHEESE_LIST_VIEW_TITLE")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CheeseListView(viewModel: CheeseListViewModel(api: MockApi()))
    }
}
