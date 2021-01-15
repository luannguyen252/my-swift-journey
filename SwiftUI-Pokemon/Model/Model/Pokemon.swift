//
//  Pokemon.swift
//  Pokemon
//
//  Created by josh on 2019/07/17.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.

// MARK: - Pokemon
public struct Pokemon: Codable, Equatable {
    public let abilities: [Ability]?
    public let baseExperience: Int?
    public let forms: [Species]?
    public let gameIndices: [GameIndex]?
    public let height: Int?
    public let heldItems: [HeldItem]?
    public let id: Int?
    public let isDefault: Bool?
    public let locationAreaEncounters: String?
    public let moves: [Move]?
    public let name: String
    public let order: Int?
    public let species: Species?
    public let sprites: Sprites?
    public let stats: [Stat]?
    public let types: [TypeElement]?
    public let weight: Int?

    enum CodingKeys: String, CodingKey {
        case abilities
        case baseExperience = "base_experience"
        case forms
        case gameIndices = "game_indices"
        case height
        case heldItems = "held_items"
        case id
        case isDefault = "is_default"
        case locationAreaEncounters = "location_area_encounters"
        case moves, name, order, species, sprites, stats, types, weight
    }

    public init(abilities: [Ability]?, baseExperience: Int?, forms: [Species]?, gameIndices: [GameIndex]?, height: Int?, heldItems: [HeldItem]?, id: Int?, isDefault: Bool?, locationAreaEncounters: String?, moves: [Move]?, name: String, order: Int?, species: Species?, sprites: Sprites?, stats: [Stat]?, types: [TypeElement]?, weight: Int?) {
        self.abilities = abilities
        self.baseExperience = baseExperience
        self.forms = forms
        self.gameIndices = gameIndices
        self.height = height
        self.heldItems = heldItems
        self.id = id
        self.isDefault = isDefault
        self.locationAreaEncounters = locationAreaEncounters
        self.moves = moves
        self.name = name
        self.order = order
        self.species = species
        self.sprites = sprites
        self.stats = stats
        self.types = types
        self.weight = weight
    }
}

// MARK: - Ability
public struct Ability: Codable, Equatable, Identifiable {
    public let ability: Species
    public let isHidden: Bool?
    public let slot: Int?

    public typealias ID = String

    public var id: Self.ID { return ability.name }

    enum CodingKeys: String, CodingKey {
        case ability
        case isHidden = "is_hidden"
        case slot
    }

    public init(ability: Species, isHidden: Bool?, slot: Int?) {
        self.ability = ability
        self.isHidden = isHidden
        self.slot = slot
    }
}

// MARK: - Species
public struct Species: Codable, Equatable {
    public let name: String
    public let url: String?

    public init(name: String, url: String?) {
        self.name = name
        self.url = url
    }
}

// MARK: - GameIndex
public struct GameIndex: Codable, Equatable {
    public let gameIndex: Int?
    public let version: Species?

    enum CodingKeys: String, CodingKey {
        case gameIndex = "game_index"
        case version
    }

    public init(gameIndex: Int?, version: Species?) {
        self.gameIndex = gameIndex
        self.version = version
    }
}

// MARK: - HeldItem
public struct HeldItem: Codable, Equatable {
    public let item: Species?
    public let versionDetails: [VersionDetail]?

    enum CodingKeys: String, CodingKey {
        case item
        case versionDetails = "version_details"
    }

    public init(item: Species?, versionDetails: [VersionDetail]?) {
        self.item = item
        self.versionDetails = versionDetails
    }
}

// MARK: - VersionDetail
public struct VersionDetail: Codable, Equatable {
    public let rarity: Int?
    public let version: Species?

    public init(rarity: Int?, version: Species?) {
        self.rarity = rarity
        self.version = version
    }
}

// MARK: - Move
public struct Move: Codable, Equatable {
    public let move: Species?
    public let versionGroupDetails: [VersionGroupDetail]?

    enum CodingKeys: String, CodingKey {
        case move
        case versionGroupDetails = "version_group_details"
    }

    public init(move: Species?, versionGroupDetails: [VersionGroupDetail]?) {
        self.move = move
        self.versionGroupDetails = versionGroupDetails
    }
}

// MARK: - VersionGroupDetail
public struct VersionGroupDetail: Codable, Equatable {
    public let levelLearnedAt: Int?
    public let moveLearnMethod, versionGroup: Species?

    enum CodingKeys: String, CodingKey {
        case levelLearnedAt = "level_learned_at"
        case moveLearnMethod = "move_learn_method"
        case versionGroup = "version_group"
    }

    public init(levelLearnedAt: Int?, moveLearnMethod: Species?, versionGroup: Species?) {
        self.levelLearnedAt = levelLearnedAt
        self.moveLearnMethod = moveLearnMethod
        self.versionGroup = versionGroup
    }
}

// MARK: - Sprites
public struct Sprites: Codable, Equatable {
    public let backDefault, backFemale, backShiny, backShinyFemale: URL?
    public let frontDefault, frontFemale, frontShiny, frontShinyFemale: URL?

    enum CodingKeys: String, CodingKey {
        case backDefault = "back_default"
        case backFemale = "back_female"
        case backShiny = "back_shiny"
        case backShinyFemale = "back_shiny_female"
        case frontDefault = "front_default"
        case frontFemale = "front_female"
        case frontShiny = "front_shiny"
        case frontShinyFemale = "front_shiny_female"
    }

    public init(backDefault: URL?, backFemale: URL?, backShiny: URL?, backShinyFemale: URL?, frontDefault: URL?, frontFemale: URL?, frontShiny: URL?, frontShinyFemale: URL?) {
        self.backDefault = backDefault
        self.backFemale = backFemale
        self.backShiny = backShiny
        self.backShinyFemale = backShinyFemale
        self.frontDefault = frontDefault
        self.frontFemale = frontFemale
        self.frontShiny = frontShiny
        self.frontShinyFemale = frontShinyFemale
    }
}

// MARK: - Stat
public struct Stat: Codable, Equatable {
    public let baseStat, effort: Int?
    public let stat: Species?

    enum CodingKeys: String, CodingKey {
        case baseStat = "base_stat"
        case effort, stat
    }

    public init(baseStat: Int?, effort: Int?, stat: Species?) {
        self.baseStat = baseStat
        self.effort = effort
        self.stat = stat
    }
}

// MARK: - TypeElement
public struct TypeElement: Codable, Equatable {
    public let slot: Int?
    public let type: Species?

    public init(slot: Int?, type: Species?) {
        self.slot = slot
        self.type = type
    }
}
