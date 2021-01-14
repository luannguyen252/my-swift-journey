//
// GalaxyService.swift
// Examples
//
// Created by CypherPoet on 8/20/20.
// ✌️
//

import Foundation
import Combine


protocol GalaxyServicing {
    func findNewGalaxies() -> AnyPublisher<[Galaxy], GalaxyServiceError>
}


extension GalaxyServicing {

    func findNewGalaxies() -> AnyPublisher<[Galaxy], GalaxyServiceError> {
        let fetchDuration = TimeInterval.random(in: 1...3)

        let galaxies: [Galaxy] = [
            .andromeda,
            .milkyWay,
            .eyeOfSauron,
            .cartwheel,
        ]

        return Future<[Galaxy], GalaxyServiceError> { promise in
            DispatchQueue.main.asyncAfter(deadline: .now() + fetchDuration) {
                // Simulate a random failure
                guard Int.random(in: 1...3) != 3 else {
                    promise(.failure(GalaxyServiceError.allCases.randomElement()!))
                    return
                }

                let result = galaxies
                    .shuffled()
                    .prefix(3)

                promise(.success(Array(result)))
            }
        }
        .eraseToAnyPublisher()
    }
}


public final class GalaxyService: GalaxyServicing {

}
