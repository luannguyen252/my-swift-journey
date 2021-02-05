//
//  Food+CoreDataProperties.swift
//  Meals3
//
//  Created by Uwe Petersen on 31.10.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//
//

import Foundation
import CoreData


extension Food {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Food> {
        return NSFetchRequest<Food>(entityName: "Food")
    }

    @NSManaged public var aminoAcidAlanine: NSNumber?
    @NSManaged public var aminoAcidArginine: NSNumber?
    @NSManaged public var aminoAcidAsparticAcid: NSNumber?
    @NSManaged public var aminoAcidCysteine: NSNumber?
    @NSManaged public var aminoAcidEssentialAminoAcids: NSNumber?
    @NSManaged public var aminoAcidGlutamicAcid: NSNumber?
    @NSManaged public var aminoAcidGlycine: NSNumber?
    @NSManaged public var aminoAcidHistidine: NSNumber?
    @NSManaged public var aminoAcidIsoleucine: NSNumber?
    @NSManaged public var aminoAcidLeucine: NSNumber?
    @NSManaged public var aminoAcidLysine: NSNumber?
    @NSManaged public var aminoAcidMethionine: NSNumber?
    @NSManaged public var aminoAcidNonEssentialAminoAcids: NSNumber?
    @NSManaged public var aminoAcidPhenylalanine: NSNumber?
    @NSManaged public var aminoAcidProline: NSNumber?
    @NSManaged public var aminoAcidPurine: NSNumber?
    @NSManaged public var aminoAcidSerine: NSNumber?
    @NSManaged public var aminoAcidThreonine: NSNumber?
    @NSManaged public var aminoAcidTryptophan: NSNumber?
    @NSManaged public var aminoAcidTyrosine: NSNumber?
    @NSManaged public var aminoAcidUricAcid: NSNumber?
    @NSManaged public var aminoAcidValine: NSNumber?
    @NSManaged public var carbCellulose: NSNumber?
    @NSManaged public var carbDisaccharide: NSNumber?
    @NSManaged public var carbFructose: NSNumber?
    @NSManaged public var carbGalactose: NSNumber?
    @NSManaged public var carbGlucose: NSNumber?
    @NSManaged public var carbGlycogen: NSNumber?
    @NSManaged public var carbLactose: NSNumber?
    @NSManaged public var carbLignin: NSNumber?
    @NSManaged public var carbMaltose: NSNumber?
    @NSManaged public var carbMannitol: NSNumber?
    @NSManaged public var carbMonosaccharide: NSNumber?
    @NSManaged public var carbOligosaccharideNonResorbable: NSNumber?
    @NSManaged public var carbOligosaccharideResorbable: NSNumber?
    @NSManaged public var carbPolyHexose: NSNumber?
    @NSManaged public var carbPolyPentose: NSNumber?
    @NSManaged public var carbPolysaccharide: NSNumber?
    @NSManaged public var carbPolyUronicAcid: NSNumber?
    @NSManaged public var carbSorbitol: NSNumber?
    @NSManaged public var carbStarch: NSNumber?
    @NSManaged public var carbSucrose: NSNumber?
    @NSManaged public var carbSugar: NSNumber?
    @NSManaged public var carbSugarAlcohol: NSNumber?
    @NSManaged public var carbWaterInsolubleDietaryFiber: NSNumber?
    @NSManaged public var carbWaterSolubleDietaryFiber: NSNumber?
    @NSManaged public var carbXylitol: NSNumber?
    @NSManaged public var comment: String?
    @NSManaged public var consecutiveNumberAsString: String?
    @NSManaged public var dateOfCreation: Date?
    @NSManaged public var dateOfLastModification: Date?
    @NSManaged public var elementCopper: NSNumber?
    @NSManaged public var elementFluorine: NSNumber?
    @NSManaged public var elementIodine: NSNumber?
    @NSManaged public var elementIron: NSNumber?
    @NSManaged public var elementManganese: NSNumber?
    @NSManaged public var elementZinc: NSNumber?
    @NSManaged public var fattyAcidButyricAcid: NSNumber?
    @NSManaged public var fattyAcidCholesterol: NSNumber?
    @NSManaged public var fattyAcidDecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosadienoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosahexaenoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosanoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosapentaenoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosatetraenoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosatrienoicAcid: NSNumber?
    @NSManaged public var fattyAcidDocosenoicAcid: NSNumber?
    @NSManaged public var fattyAcidDodecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidEicosadienoicAcid: NSNumber?
    @NSManaged public var fattyAcidEicosanoicAcid: NSNumber?
    @NSManaged public var fattyAcidEicosapentaeonoicAcid: NSNumber?
    @NSManaged public var fattyAcidEicosatetraenoicAcid: NSNumber?
    @NSManaged public var fattyAcidEicosatrienoicAcid: NSNumber?
    @NSManaged public var fattyAcidEicosenoicAcid: NSNumber?
    @NSManaged public var fattyAcidGlycerin: NSNumber?
    @NSManaged public var fattyAcidHeptadecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidHeptadecenoicAcid: NSNumber?
    @NSManaged public var fattyAcidHexadecadieonicAcid: NSNumber?
    @NSManaged public var fattyAcidHexadecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidHexadecatetraenoicAcid: NSNumber?
    @NSManaged public var fattyAcidHexadecenoicAcid: NSNumber?
    @NSManaged public var fattyAcidHexanoicAcid: NSNumber?
    @NSManaged public var fattyAcidLongChainFattyAcids: NSNumber?
    @NSManaged public var fattyAcidMediumChainFattyAcids: NSNumber?
    @NSManaged public var fattyAcidMonounsaturatedFattyAcids: NSNumber?
    @NSManaged public var fattyAcidNonadecatrienoicAcid: NSNumber?
    @NSManaged public var fattyAcidOctadecadienoicAcid: NSNumber?
    @NSManaged public var fattyAcidOctadecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidOctadecatetraenoicAcid: NSNumber?
    @NSManaged public var fattyAcidOctadecatrienoicAcid: NSNumber?
    @NSManaged public var fattyAcidOctadecenoidAcid: NSNumber?
    @NSManaged public var fattyAcidOctanoicAcid: NSNumber?
    @NSManaged public var fattyAcidOmega3FattyAcids: NSNumber?
    @NSManaged public var fattyAcidOmega6FattyAcids: NSNumber?
    @NSManaged public var fattyAcidPentadecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidPentadecenoicAcid: NSNumber?
    @NSManaged public var fattyAcidPolyunsaturatedFattyAcids: NSNumber?
    @NSManaged public var fattyAcidSaturatedFattyAcids: NSNumber?
    @NSManaged public var fattyAcidShortChainFattyAcids: NSNumber?
    @NSManaged public var fattyAcidTetracosanoicAcid: NSNumber?
    @NSManaged public var fattyAcidTetracosenoicAcid: NSNumber?
    @NSManaged public var fattyAcidTetradecanoicAcid: NSNumber?
    @NSManaged public var fattyAcidTetradecenoicAcid: NSNumber?
    @NSManaged public var glycemicIndex: NSNumber?
    @NSManaged public var glycemicLoad: NSNumber?
    @NSManaged public var key: String?
    @NSManaged public var mineralCalcium: NSNumber?
    @NSManaged public var mineralChlorine: NSNumber?
    @NSManaged public var mineralMagnesium: NSNumber?
    @NSManaged public var mineralPhosphorus: NSNumber?
    @NSManaged public var mineralPotassium: NSNumber?
    @NSManaged public var mineralSodium: NSNumber?
    @NSManaged public var mineralSulphur: NSNumber?
    @NSManaged public var name: String?
    @NSManaged public var nameEnglish: String?
    @NSManaged public var totalAlcohol: NSNumber?
    @NSManaged public var totalCarb: NSNumber?
    @NSManaged public var totalDietaryFiber: NSNumber?
    @NSManaged public var totalEnergyCals: NSNumber?
    @NSManaged public var totalEnergyJoule: NSNumber?
    @NSManaged public var totalEnergyWithFiberCals: NSNumber?
    @NSManaged public var totalEnergyWithFiberJoule: NSNumber?
    @NSManaged public var totalFat: NSNumber?
    @NSManaged public var totalMineralsInRawAsh: NSNumber?
    @NSManaged public var totalOrganicAcids: NSNumber?
    @NSManaged public var totalProtein: NSNumber?
    @NSManaged public var totalSalt: NSNumber?
    @NSManaged public var totalWater: NSNumber?
    @NSManaged public var vitaminA: NSNumber?
    @NSManaged public var vitaminABetaCarotene: NSNumber?
    @NSManaged public var vitaminARetinol: NSNumber?
    @NSManaged public var vitaminB1: NSNumber?
    @NSManaged public var vitaminB2: NSNumber?
    @NSManaged public var vitaminB3: NSNumber?
    @NSManaged public var vitaminB3Niacin: NSNumber?
    @NSManaged public var vitaminB5: NSNumber?
    @NSManaged public var vitaminB6: NSNumber?
    @NSManaged public var vitaminB7: NSNumber?
    @NSManaged public var vitaminB9: NSNumber?
    @NSManaged public var vitaminB12: NSNumber?
    @NSManaged public var vitaminC: NSNumber?
    @NSManaged public var vitaminD: NSNumber?
    @NSManaged public var vitaminE: NSNumber?
    @NSManaged public var vitaminETocopherol: NSNumber?
    @NSManaged public var vitaminK: NSNumber?
    @NSManaged public var brand: Brand?
    @NSManaged public var dealer: Dealer?
    @NSManaged public var detail: Detail?
    @NSManaged public var favoriteListItem: Favorite?
    @NSManaged public var group: Group?
    @NSManaged public var mealIngredients: NSSet?
    @NSManaged public var preparation: Preparation?
    @NSManaged public var recipe: Recipe?
    @NSManaged public var recipeIngredients: NSSet?
    @NSManaged public var referenceWeight: ReferenceWeight?
    @NSManaged public var servingSizes: NSSet?
    @NSManaged public var source: Source?
    @NSManaged public var subGroup: SubGroup?

}

// MARK: Generated accessors for mealIngredients
extension Food {

    @objc(addMealIngredientsObject:)
    @NSManaged public func addToMealIngredients(_ value: MealIngredient)

    @objc(removeMealIngredientsObject:)
    @NSManaged public func removeFromMealIngredients(_ value: MealIngredient)

    @objc(addMealIngredients:)
    @NSManaged public func addToMealIngredients(_ values: NSSet)

    @objc(removeMealIngredients:)
    @NSManaged public func removeFromMealIngredients(_ values: NSSet)

}

// MARK: Generated accessors for recipeIngredients
extension Food {

    @objc(addRecipeIngredientsObject:)
    @NSManaged public func addToRecipeIngredients(_ value: RecipeIngredient)

    @objc(removeRecipeIngredientsObject:)
    @NSManaged public func removeFromRecipeIngredients(_ value: RecipeIngredient)

    @objc(addRecipeIngredients:)
    @NSManaged public func addToRecipeIngredients(_ values: NSSet)

    @objc(removeRecipeIngredients:)
    @NSManaged public func removeFromRecipeIngredients(_ values: NSSet)

}

// MARK: Generated accessors for servingSizes
extension Food {

    @objc(addServingSizesObject:)
    @NSManaged public func addToServingSizes(_ value: ServingSize)

    @objc(removeServingSizesObject:)
    @NSManaged public func removeFromServingSizes(_ value: ServingSize)

    @objc(addServingSizes:)
    @NSManaged public func addToServingSizes(_ values: NSSet)

    @objc(removeServingSizes:)
    @NSManaged public func removeFromServingSizes(_ values: NSSet)

}
