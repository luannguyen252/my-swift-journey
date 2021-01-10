import SwiftUI

enum CoffeeType: CaseIterable {
    case blend
    case american
    case cafeole
    case blendBlack
    case cappuccino
    case cafelatte
    case cafeMacchiato
    case cafeMocha
    case caramelMacchiato
    case icedCoffee
    case icedMilkCoffee
    case espresso

    var title: String {
        switch self {
        case .blend:
            return "ブレンドコーヒー"
        case .american:
            return "アメリカンコーヒー"
        case .cafeole:
            return "カフェオレ"
        case .blendBlack:
            return "ブレンドブラックコーヒー"
        case .cappuccino:
            return "カプチーノ"
        case .cafelatte:
            return "カフェラテ"
        case .cafeMacchiato:
            return "カフェマキアート"
        case .cafeMocha:
            return "カフェモカ"
        case .caramelMacchiato:
            return "キャラメルマキアート"
        case .icedCoffee:
            return "アイスコーヒー"
        case .icedMilkCoffee:
            return "アイスミルクコーヒー"
        case .espresso:
            return "エスプレッソ"
        }
    }

    var description: String {
        switch self {
        case .blend:
            return "ドリップコーヒーの中でも主役級の存在感"
        case .american:
            return "口当たりがさっぱり"
        case .cafeole:
            return "ミルクのまろやかさを加えた口当たりの良さ"
        case .blendBlack:
            return "ブレンドコーヒーの濃い版"
        case .cappuccino:
            return "泡立てたミルクのなめらかさが口当たりの良さ"
        case .cafelatte:
            return "苦味と風味の強いエスプレッソコーヒーにミルクを混ぜ合わせたもの"
        case .cafeMacchiato:
            return "泡立てたミルクをほんの少しだけ加えたエスプレッソコーヒー"
        case .cafeMocha:
            return "しっかりとした甘みとほのかな苦味を同時に味わう"
        case .caramelMacchiato:
            return "カフェラテをキャラメル味のシロップで味付け"
        case .icedCoffee:
            return "冷たいコーヒー"
        case .icedMilkCoffee:
            return "冷たいコーヒーにミルクを入れた"
        case .espresso:
            return "濃厚な風味と深い香りが凝縮"
        }
    }

    var image: Image {
        switch self {
        case .blend:
            return .init("coffee01_blend")
        case .american:
            return .init("coffee02_american")
        case .cafeole:
            return .init("coffee03_cafeole")
        case .blendBlack:
            return .init("coffee04_blend_black")
        case .cappuccino:
            return .init("coffee05_cappuccino")
        case .cafelatte:
            return .init("coffee06_cafelatte")
        case .cafeMacchiato:
            return .init("coffee07_cafe_macchiato")
        case .cafeMocha:
            return .init("coffee08_cafe_mocha")
        case .caramelMacchiato:
            return .init("coffee09_caramel_macchiato")
        case .icedCoffee:
            return .init("coffee10_iced_coffee")
        case .icedMilkCoffee:
            return .init("coffee11_iced_milk_coffee")
        case .espresso:
            return .init("coffee12_espresso")
        }
    }

    var rating: Int {
        switch self {
        case .blend:
            return 5
        case .american:
            return 4
        case .cafeole:
            return 3
        case .blendBlack:
            return 5
        case .cappuccino:
            return 3
        case .cafelatte:
            return 4
        case .cafeMacchiato:
            return 2
        case .cafeMocha:
            return 2
        case .caramelMacchiato:
            return 4
        case .icedCoffee:
            return 5
        case .icedMilkCoffee:
            return 2
        case .espresso:
            return 5   
        }
    }
}
