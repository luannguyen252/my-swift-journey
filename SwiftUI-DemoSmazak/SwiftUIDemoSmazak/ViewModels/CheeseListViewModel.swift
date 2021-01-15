//
//  CheeseListViewModel.swift
//  SwiftUIDemoSmazak
//
//  Created by Marek Přidal on 03/09/2019.
//  Copyright © 2019 Marek Přidal. All rights reserved.
//

import Combine
import Foundation

protocol CheeseListViewModelDelegate: class {
    func showDetail(cheese: Cheese)
}

final class CheeseListViewModel: ObservableObject {
    // MARK: - ObservableObject
    let objectWillChange = PassthroughSubject<Void, Never>()

    // MARK: - Delegate
    weak var delegate: CheeseListViewModelDelegate?
    
    var cheeses: [Cheese] = [] {
        willSet {
            objectWillChange.send()
        }
    }
    
    private let api: ApiProtocol
    
    init(api: ApiProtocol) {
        self.api = api
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 1.0) { [weak self] in
            self?.getData()
        }
    }
    
    func getData() {
        api.getCheeses { [weak self] (result) in
            switch result {
            case .success(let cheeses):
                self?.cheeses = cheeses
            case .failure(let error):
                // TODO
                break
            }
        }
    }
}
