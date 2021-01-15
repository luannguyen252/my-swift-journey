//
//  HouseResponseModel+HouseDataModelConvertible.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 02.08.19.
//  Copyright © 2019 Christian Elies. All rights reserved.
//

import Foundation

extension HouseResponseModel: HouseDataModelConvertible {
    func houseDataModel() throws -> HouseDataModel {
        guard let url = url else {
            throw HouseDataModelConvertibleError.missingURL
        }

        guard let name = name else {
            throw HouseDataModelConvertibleError.missingName
        }

        guard let region = region else {
            throw HouseDataModelConvertibleError.missingRegion
        }
        
        var arms = "-"
        if let coatOfArms = coatOfArms {
            arms = coatOfArms.isEmpty ? "-" : coatOfArms
        }
        
        var word = "-"
        if let words = words {
            word = words.isEmpty ? "-" : words
        }
        
        var found = "-"
        if let founded = founded {
            found = founded.isEmpty ? "-" : founded
        }
        
        var died = "-"
        if let diedOut = diedOut {
            died = diedOut.isEmpty ? "-" : diedOut
        }
        
        var currentLordURL: URL?
        if let currentLord = currentLord {
            currentLordURL = URL(string: currentLord)
        }
        
        var heirURL: URL?
        if let heir = heir {
            heirURL = URL(string: heir)
        }
        
        var overlordURL: URL?
        if let overlord = overlord {
            overlordURL = URL(string: overlord)
        }
        
        var founderURL: URL?
        if let founder = founder {
            founderURL = URL(string: founder)
        }
        
        return HouseDataModel(url: url,
                              name: name,
                              region: region,
                              coatOfArms: arms,
                              words: word,
                              titles: titles?.filter { !$0.isEmpty } ?? [],
                              seats: seats?.filter { !$0.isEmpty } ?? [],
                              currentLord: currentLordURL,
                              heir: heirURL,
                              overlord: overlordURL,
                              founded: found,
                              founder: founderURL,
                              diedOut: died,
                              ancestralWeapons: ancestralWeapons?.filter { !$0.isEmpty } ?? [],
                              cadetBranches: cadetBranches ?? [],
                              swornMembers: swornMembers ?? [])
    }
}
