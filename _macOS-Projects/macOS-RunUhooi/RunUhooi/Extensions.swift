//
//  Extensions.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Cocoa

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: self)
    }
}

extension NSAppearance {
    var isDark: Bool {
        if self.name == .vibrantDark { return true }
        guard #available(macOS 10.14, *) else { return false }
        return self.bestMatch(from: [.aqua, .darkAqua]) == .darkAqua
    }
}

extension NSColor {
    static let url = NSColor(named: "url")!
    static let graphBlue = NSColor(named: "graphBlue")!
    static let graphYello = NSColor(named: "graphYello")!

    var dark: NSColor {
        return NSColor(hue: self.hueComponent,
                       saturation: self.saturationComponent,
                       brightness: self.brightnessComponent * 0.9,
                       alpha: self.alphaComponent)
    }
}

func / (left: CGSize, right: CGFloat) -> CGSize {
    assert(right != 0, "divide 0")
    return CGSize(width: left.width / right, height: left.height / right)
}

extension NSImage {
    convenience init(name: String) {
        self.init(imageLiteralResourceName: name)
        let rep = representations[0]
        size = CGSize(width: rep.pixelsWide, height: rep.pixelsHigh)
    }

    var ciImage: CIImage? {
        guard let imageData = self.tiffRepresentation else { return nil }
        return CIImage(data: imageData)
    }

    var mono: NSImage {
        guard let monoFilter = CIFilter(name: "CIPhotoEffectMono") else { return self }
        monoFilter.setValue(self.ciImage, forKey: kCIInputImageKey)
        guard let output = monoFilter.outputImage else { return self }
        let rep = NSCIImageRep(ciImage: output)
        let nsImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        return nsImage
    }

    var outline: NSImage {
        guard let alphaFilter = CIFilter(name: "CIMaskToAlpha") else { return self }
        alphaFilter.setValue(self.ciImage, forKey: kCIInputImageKey)
        guard let output = alphaFilter.outputImage else { return self }
        let rep = NSCIImageRep(ciImage: output)
        let nsImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        return nsImage
    }

    var inverted: NSImage {
        guard let invertFilter = CIFilter(name: "CIColorInvert") else { return self }
        invertFilter.setValue(self.ciImage, forKey: kCIInputImageKey)
        guard let output = invertFilter.outputImage else { return self }
        let rep = NSCIImageRep(ciImage: output)
        let nsImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        return nsImage
    }

    func with(paddingLeft: CGFloat) -> NSImage {
        let scale = self.size.height / 18.0
        let r = CGRect(x: -scale * paddingLeft,
                       y: 0,
                       width: self.size.width + scale * paddingLeft,
                       height: self.size.height)
        let output = self.ciImage!.clamped(to: r).cropped(to: r)
        let rep = NSCIImageRep(ciImage: output)
        let nsImage = NSImage(size: rep.size)
        nsImage.addRepresentation(rep)
        nsImage.size = nsImage.size / scale
        return nsImage
    }
    
}
