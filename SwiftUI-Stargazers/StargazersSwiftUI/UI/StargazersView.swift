//
//  StargazersView.swift
//  StargazersSwiftUI
//
//  Created by Gualtiero Frigerio on 17/09/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Combine
import SwiftUI

struct StargazersView: View {
    @ObservedObject var viewModel:StargazersViewModel
    
    var body: some View {
        VStack {
            List(viewModel.stargazers) { stargazer in
                StargazerView(stargazer: stargazer)
            }
            Button(action: {
                self.viewModel.getNextStargazers { success in
                    print("next data received")
                }
            })
            {
                Text("next")
            }
        }
    }
}

struct StargazersViewInfiniteScroll: View {
    @ObservedObject var viewModel:StargazersViewModel
    
    var body: some View {
        List(viewModel.stargazers) { stargazer in
            StargazerView(stargazer: stargazer)
                .onAppear {
                    self.elementOnAppear(stargazer)
            }
        }
    }
    
    private func elementOnAppear(_ stargazer:User) {
        if self.viewModel.isLastStargazer(stargazer) {
            self.viewModel.getNextStargazers { success in
                print("next data received")
            }
        }
    }
}

struct StargazersView_Previews: PreviewProvider {
    static var previews: some View {
        StargazersView(viewModel: StargazersViewModel())
    }
}
