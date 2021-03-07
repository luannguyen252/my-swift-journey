//
//  Model.swift
//  ModelPicker
//
//  Created by Fernando Fernandes on 24.07.20.
//

import SwiftUI
import RealityKit
import Combine

class Model {

    // MARK: - Properties

    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?

    private var cancellable: AnyCancellable? = nil

    // MARK: - Lifecycle

    init(modelName: String) {
        self.modelName = modelName
        self.image = UIImage(named: modelName)!

        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink { loadCompletion in
                if case .failure(let error) = loadCompletion {
                    print("Unable to load modelEntity for: \(modelName)")
                    print("Error: \(error)")
                }
            } receiveValue: { modelEntity in
                self.modelEntity = modelEntity
                print("Successfully loaded modelEntity for: \(modelName)")
            }
    }
}

// MARK: - Hashable

extension Model: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(modelName)
    }
}

// MARK: - Equatable

extension Model: Equatable {
    static func == (lhs: Model, rhs: Model) -> Bool {
        lhs.modelName == rhs.modelName
    }
}
