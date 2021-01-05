//
//  RunnerLayer.swift
//  RunUhooi
//
//  Created by Takuto Nakamura on 2020/10/31.
//

import Cocoa

class RunnerLayer: CALayer {

    private var keyFrameAnimation: CAKeyframeAnimation!
    private var gap: CGFloat = .zero
    private var size: CGSize = .zero
    private var motherFrame: NSRect = .zero
    var hasSequence: Bool {
        return self.keyFrameAnimation != nil
    }

    func initialize(gap: CGFloat) {
        self.gap = gap
        self.contentsGravity = CALayerContentsGravity.left
        self.masksToBounds = true
        self.contentsScale = 2.0
        if let filter = CIFilter(name: "CISourceOutCompositing") {
            let rect = CGRect(x: 0, y: 0, width: 600, height: 22)
            let ciimage = CIImage(color: CIColor.blue).cropped(to: rect)
            filter.setValue(ciimage, forKey: "inputBackgroundImage")
            self.backgroundFilters = [filter]
        }
    }

    func setSequence( _ sequence: [NSImage], _ frame: NSRect) {
        size = sequence[0].alignmentRect.size

        keyFrameAnimation = CAKeyframeAnimation(keyPath: "contents")
        keyFrameAnimation.calculationMode = .discrete
        keyFrameAnimation.fillMode = .forwards
        keyFrameAnimation.repeatCount = Float.infinity
        keyFrameAnimation.autoreverses = false
        keyFrameAnimation.isRemovedOnCompletion = false
        keyFrameAnimation.beginTime = 0.0
        keyFrameAnimation.values = sequence
        keyFrameAnimation.duration = Double(sequence.count) / 2.0
        updateFrame(frame)

        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.removeAllAnimations()
        self.add(keyFrameAnimation, forKey: "running")
        CATransaction.commit()
    }

    func updateSpeed(_ speed: Float, _ frame: NSRect) {
        motherFrame = frame
        let point = CGPoint(x: motherFrame.width - size.width - gap, y: 2.0)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        let time = CACurrentMediaTime()
        self.timeOffset = self.convertTime(time, from: nil)
        self.beginTime = time
        self.speed = speed
        self.frame = NSRect(origin: point, size: size)
        CATransaction.commit()
    }

    func updateFrame(_ frame: NSRect) {
        motherFrame = frame
        let point = CGPoint(x: motherFrame.width - size.width - gap, y: 2.0)
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        self.frame = NSRect(origin: point, size: size)
        CATransaction.commit()
    }

}
