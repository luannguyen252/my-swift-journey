//
//  Publisher+CombineEnabled.swift
//  SwiftUISurvey
//
//  Created by Amir on 08/08/2020.
//  Copyright © 2020 Amir Khorsandi. All rights reserved.
//

import Combine
import Foundation

typealias ObjectCombineEnabled = AnyObject & CombineEnabled


extension Publisher {
    
    func sinkAndAssign<T: ObjectCombineEnabled>(
        to object: T,
        completed completedKeyPath: ReferenceWritableKeyPath<T, Bool>? = nil,
        loading loadingKeyPath: ReferenceWritableKeyPath<T, Bool>? = nil,
        error errorKeyPath: ReferenceWritableKeyPath<T, Error?>? = nil,
        result resultKeyPath: ReferenceWritableKeyPath<T, Self.Output>? = nil,
        streamResult streamResultKeyPath: ReferenceWritableKeyPath<T, Array<Self.Output>>? = nil
    ) {
        if let keyPath = loadingKeyPath {
            object[keyPath: keyPath] = true
        }
        
        receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak object] result in
                    if let keyPath = loadingKeyPath {
                        object?[keyPath: keyPath] = false
                    }
                    if case .failure(let error) = result, let keyPath = errorKeyPath {
                        object?[keyPath: keyPath] = error
                    }
                    if case .finished = result, let keyPath = completedKeyPath {
                        object?[keyPath: keyPath] = true
                    }
                },
                receiveValue: { [weak object] result in
                    if let keyPath = resultKeyPath {
                        object?[keyPath: keyPath] = result
                    }
                    if let keyPath = streamResultKeyPath {
                        object?[keyPath: keyPath].append(result)
                    }
                }
            )
            .collect(by: object.cancellableBag)
    }
    
    func sinkAndAssign<T: ObjectCombineEnabled>(
        to object: T,
        state keyPath: ReferenceWritableKeyPath<T, PublisherState<Self.Output, Self.Failure>>
    ) {
        DispatchQueue.main.async {
            object[keyPath: keyPath] = .inProgress([])
        }
        receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak object] result in
                    guard let object = object else { return }
                    switch result {
                    case .failure(let error):
                        object[keyPath: keyPath] = .error(error)
                    case .finished:
                        var values: [Self.Output] = []
                        if case .inProgress(let lastValues) = object[keyPath: keyPath] {
                            values = lastValues
                        }
                        object[keyPath: keyPath] = .completed(values)
                    }
                },
                receiveValue: { [weak object] result in
                    guard let object = object else { return }
                    var values: [Self.Output] = []
                    if case .inProgress(let lastValues) = object[keyPath: keyPath] {
                        values = lastValues
                    }
                    values.append(result)
                    object[keyPath: keyPath] = .inProgress(values)
                }
            )
            .collect(by: object.cancellableBag)
    }
    
}


extension Publisher {
    func handleAndAssign<T: ObjectCombineEnabled>(
        to object: T,
        loading loadingKeyPath: ReferenceWritableKeyPath<T, Bool>? = nil,
        completed completedKeyPath: ReferenceWritableKeyPath<T, Bool>? = nil,
        error errorKeyPath: ReferenceWritableKeyPath<T, Error?>? = nil,
        result resultKeyPath: ReferenceWritableKeyPath<T, Self.Output?>? = nil
    ) -> Publishers.HandleEvents<Self> {
        handleEvents(
            receiveOutput: { [weak object] result in
                guard let keyPath = resultKeyPath else { return }
                object?[keyPath: keyPath] = result
            },
            receiveCompletion: { [weak object] result in
                if case .failure(let error) = result, let keyPath = errorKeyPath {
                    object?[keyPath: keyPath] = error
                }
                if case .finished = result, let keyPath = completedKeyPath {
                    object?[keyPath: keyPath] = true
                }
            })
    }
}

