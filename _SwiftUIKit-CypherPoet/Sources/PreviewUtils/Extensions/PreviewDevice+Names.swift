import SwiftUI


extension PreviewDevice {

    public enum Name {
        public static let iPhone8 = "iPhone 8"
        public static let iPhone8Plus = "iPhone 8 Plus"
        public static let iPhone11 = "iPhone 11"
        public static let iPhone11Pro = "iPhone 11 Pro"
        public static let iPhone11ProMax = "iPhone 11 Pro Max"
        public static let iPhoneSE2 = "iPhone SE (2nd generation)"

        public static let iPadPro9Point7Inch = "iPad Pro (9.7-inch)"
        public static let iPadPro11Inch = "iPad Pro (11-inch) (2nd generation)"
        public static let iPadPro12Point9Inch = "iPad Pro (12.9-inch) (4th generation)"
    }
}


extension PreviewDevice {
    public static let iPhone8 = PreviewDevice(rawValue: PreviewDevice.Name.iPhone8)
    public static let iPhone8Plus = PreviewDevice(rawValue: PreviewDevice.Name.iPhone8Plus)
    public static let iPhone11 = PreviewDevice(rawValue: PreviewDevice.Name.iPhone11)
    public static let iPhone11Pro = PreviewDevice(rawValue: PreviewDevice.Name.iPhone11Pro)
    public static let iPhone11ProMax = PreviewDevice(rawValue: PreviewDevice.Name.iPhone11ProMax)
    public static let iPhoneSE2 = PreviewDevice(rawValue: PreviewDevice.Name.iPhoneSE2)

    public static let iPadPro9Point7Inch = PreviewDevice(rawValue: PreviewDevice.Name.iPadPro9Point7Inch)
    public static let iPadPro11Inch = PreviewDevice(rawValue: PreviewDevice.Name.iPadPro11Inch)
    public static let iPadPro12Point9Inch = PreviewDevice(rawValue: PreviewDevice.Name.iPadPro12Point9Inch)


    public static let all: [PreviewDevice] = [
        .iPhone8,
        .iPhone8Plus,
        .iPhone11,
        .iPhone11Pro,
        .iPhone11ProMax,
        .iPhoneSE2,
        .iPadPro9Point7Inch,
        .iPadPro11Inch,
        .iPadPro12Point9Inch,
    ]
}
