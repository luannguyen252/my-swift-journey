//
//  IndicatorManager.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Cocoa

struct DrawTarget {
    var img: NSImage?
    var attr: NSAttributedString?
    var pos: NSPoint

    init(img: NSImage, pos: NSPoint) {
        self.img = img
        self.pos = pos
    }

    init(attr: NSAttributedString, pos: NSPoint) {
        self.attr = attr
        self.pos = pos
    }

    func draw() {
        if let img = img {
            img.draw(at: pos, from: .zero, operation: .copy, fraction: 1.0)
        }
        if let attr = attr {
            attr.draw(at: pos)
        }
    }
}

class IndicatorManager {

    static func createIndicator(cpu: String? = nil) -> NSImage {
        let icon = NSImage(name: "uhooi-mono-0")
        let spacing: CGFloat = 2.0
        let font = NSFont(name: "Menlo", size: 22.0)!
        var width: CGFloat = 0.0
        var targets = [DrawTarget]()

        if let cpu = cpu {
            let cpuImg = NSImage(name: "cpu")
            let size = cpuImg.alignmentRect.size
            targets.append(DrawTarget(img: cpuImg, pos: NSPoint(x: width, y: 0.0)))
            width += size.width + spacing
            let attrStr = NSAttributedString(string: cpu, attributes: [NSAttributedString.Key.font: font])
            targets.append(DrawTarget(attr: attrStr, pos: NSPoint(x: width, y: 5.0)))
            width += attrStr.size().width + 4.0 + spacing
        }

        let size = icon.alignmentRect.size
        let outlineIcon = icon.mono.inverted.outline
        targets.append(DrawTarget(img: outlineIcon, pos: NSPoint(x: width, y: 0.0)))
        width = ceil(width + size.width)

        let image = NSImage(size: NSSize(width: width, height: 36.0))
        image.lockFocus()
        targets.forEach { (target) in
            target.draw()
        }
        image.unlockFocus()
        image.size = NSSize(width: ceil(0.5 * width), height: 18.0)
        image.isTemplate = true
        return image
    }

}

