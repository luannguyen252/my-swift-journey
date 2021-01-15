//
//  HouseModel+initWithDataModel.swift
//  Game-of-Thrones-SwiftUI
//
//  Created by Christian Elies on 26.07.20.
//  Copyright © 2020 Christian Elies. All rights reserved.
//

extension HouseModel {
    init(dataModel: HouseDataModel) {
        self.init(
            name: dataModel.name,
            region: dataModel.region,
            coatOfArms: dataModel.coatOfArms,
            words: dataModel.words,
            titles: dataModel.titles,
            seats: dataModel.seats,
            currentLord: dataModel.currentLord,
            heir: dataModel.heir,
            overlord: dataModel.overlord,
            founded: dataModel.founded,
            founder: dataModel.founder,
            diedOut: dataModel.diedOut,
            ancestralWeapons: dataModel.ancestralWeapons,
            cadetBranches: dataModel.cadetBranches,
            swornMembers: dataModel.swornMembers
        )
    }
}
