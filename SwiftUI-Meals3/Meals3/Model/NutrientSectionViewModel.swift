//
//  VewModelFoodSection.swift
//  Meals3
//
//  Created by Uwe Petersen on 04.12.19.
//  Copyright © 2019 Uwe Petersen. All rights reserved.
//

import Foundation

struct NutrientSectionViewModel: Hashable, Identifiable {
    var header: String
    var keys: [String]
    
    var id: String {
        header
    }
    
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(header)
//    }
}

extension NutrientSectionViewModel {
    static func sections() -> [NutrientSectionViewModel] {
        var sections = [NutrientSectionViewModel(header: "GRUNDNÄHRWERTE JE 100 g",
                                                keys: ["totalEnergyCals", "totalCarb", "totalProtein", "totalFat", "totalAlcohol", "totalDietaryFiber", "totalMineralsInRawAsh","totalOrganicAcids","totalWater", "totalSalt"]
        )]
        sections.append( NutrientSectionViewModel(header: "EIN-/ZWEIFACHZUCKER JE 100 g",
                                                 keys: ["carbGlucose",  "carbFructose", "carbGalactose", "carbMonosaccharide", "carbSucrose", "carbMaltose", "carbLactose", "carbDisaccharide", "carbSugar"]
        ))

        sections.append( NutrientSectionViewModel(header: "ZUCKERALKOHOLE JE 100 g",
                                                 keys: ["carbMannitol", "carbSorbitol", "carbXylitol", "carbSugarAlcohol"]
        ))

        sections.append( NutrientSectionViewModel(header: "HÖHERWERTIGE KOHLEHYDRATE JE 100 g",
                                                 keys: ["carbOligosaccharideResorbable", "carbOligosaccharideNonResorbable", "carbGlycogen", "carbStarch", "carbPolysaccharide", "carbPolyPentose", "carbPolyHexose", "carbPolyUronicAcid", "carbCellulose", "carbLignin", "carbWaterSolubleDietaryFiber", "carbWaterInsolubleDietaryFiber"]
        ))

        sections.append( NutrientSectionViewModel(header: "FETTE JE 100 g",
                                                 keys: ["fattyAcidPolyunsaturatedFattyAcids", "fattyAcidShortChainFattyAcids", "fattyAcidMediumChainFattyAcids", "fattyAcidLongChainFattyAcids", "fattyAcidOmega3FattyAcids", "fattyAcidOmega6FattyAcids", "fattyAcidGlycerin", "fattyAcidCholesterol"]
        ))

        sections.append( NutrientSectionViewModel(header: "MINERALIEN JE 100 g",
                                                 keys: ["mineralSodium", "mineralPotassium", "mineralCalcium", "mineralMagnesium", "mineralPhosphorus", "mineralSulphur", "mineralChlorine"]
        ))

        sections.append( NutrientSectionViewModel(header: "SPURENELEMENTE JE 100 g",
                                                 keys:  ["elementIron", "elementZinc", "elementCopper", "elementManganese", "elementFluorine", "elementIodine"]
        ))

        sections.append( NutrientSectionViewModel(header: "VITAMINE JE 100 g",
                                                 keys: ["vitaminA", "vitaminARetinol", "vitaminABetaCarotene", "vitaminD", "vitaminE", "vitaminETocopherol", "vitaminK", "vitaminB1", "vitaminB2", "vitaminB3Niacin", "vitaminB3", "vitaminB5", "vitaminB6", "vitaminB7", "vitaminB9", "vitaminB12", "vitaminC"]
        ))
        sections.append( NutrientSectionViewModel(header: "AMINOSÄUREN JE 100 g",
                                                 keys:  ["aminoAcidIsoleucine", "aminoAcidLeucine", "aminoAcidLysine", "aminoAcidMethionine", "aminoAcidCysteine", "aminoAcidPhenylalanine", "aminoAcidTyrosine", "aminoAcidThreonine", "aminoAcidTryptophan", "aminoAcidValine", "aminoAcidArginine", "aminoAcidHistidine", "aminoAcidEssentialAminoAcids", "aminoAcidAlanine", "aminoAcidAsparticAcid", "aminoAcidGlutamicAcid", "aminoAcidGlycine", "aminoAcidProline", "aminoAcidSerine", "aminoAcidNonEssentialAminoAcids", "aminoAcidUricAcid", "aminoAcidPurine"]
        ))
        sections.append( NutrientSectionViewModel(header: "FETTSÄUREN JE 100 g",
                                                 keys: ["fattyAcidButyricAcid", "fattyAcidHexanoicAcid", "fattyAcidOctanoicAcid", "fattyAcidDecanoicAcid", "fattyAcidDodecanoicAcid", "fattyAcidTetradecanoicAcid", "fattyAcidPentadecanoicAcid", "fattyAcidHexadecanoicAcid", "fattyAcidHeptadecanoicAcid", "fattyAcidOctadecanoicAcid", "fattyAcidEicosanoicAcid", "fattyAcidDocosanoicAcid", "fattyAcidTetracosanoicAcid", "fattyAcidSaturatedFattyAcids", "fattyAcidTetradecenoicAcid", "fattyAcidPentadecenoicAcid", "fattyAcidHexadecenoicAcid", "fattyAcidHeptadecenoicAcid", "fattyAcidOctadecenoidAcid", "fattyAcidEicosenoicAcid", "fattyAcidDocosenoicAcid", "fattyAcidTetracosenoicAcid", "fattyAcidMonounsaturatedFattyAcids", "fattyAcidHexadecadieonicAcid", "fattyAcidHexadecatetraenoicAcid", "fattyAcidOctadecadienoicAcid", "fattyAcidOctadecatrienoicAcid", "fattyAcidOctadecatetraenoicAcid", "fattyAcidNonadecatrienoicAcid", "fattyAcidEicosadienoicAcid", "fattyAcidEicosatrienoicAcid", "fattyAcidEicosatetraenoicAcid", "fattyAcidEicosapentaeonoicAcid", "fattyAcidDocosadienoicAcid", "fattyAcidDocosatrienoicAcid", "fattyAcidDocosatetraenoicAcid", "fattyAcidDocosapentaenoicAcid", "fattyAcidDocosahexaenoicAcid"]
        ))

        return sections
    }
}
