import SwiftUI

public struct PlaygroundPhone: ViewModifier {
    public enum PhoneType {
        case iPhone8
        case iPhone8Plus
        case iPhone11
        case iPhone11Pro
        case iPhone11ProMax
        case iPhone12
        case iPhone12Pro
        case iPhone12ProMax
        case iPhone12Mini
        case iPhoneSE
        
        var width: CGFloat {
            switch self {
            case .iPhone8, .iPhoneSE:
                return 375
            case .iPhone8Plus:
                return 414
            case .iPhone11:
                return 414
            case .iPhone11Pro, .iPhone12Mini:
                return 375
            case .iPhone11ProMax:
                return 428
            case .iPhone12, .iPhone12Pro:
                return 390
            case .iPhone12ProMax:
                return 428
            }
        }
        
        var height: CGFloat {
            switch self {
            case .iPhone8, .iPhoneSE:
                return 647
            case .iPhone8Plus:
                return 716
            case .iPhone11:
                return 814
            case .iPhone11Pro, .iPhone12Mini:
                return 724
            case .iPhone11ProMax:
                return 818
            case .iPhone12, .iPhone12Pro:
                return 763
            case .iPhone12ProMax:
                return 845
            }
        }
    }
    let phoneType:PhoneType
    public func body(content: Content) -> some View {
        return ZStack {
            Color.white
            content
        }
        .frame(width:phoneType.width, height: phoneType.height)
    }
}

 extension View {
    public func playgroundPhone(_ phoneType:PlaygroundPhone.PhoneType) -> some View {
        self.modifier(PlaygroundPhone(phoneType: phoneType))
    }
}
