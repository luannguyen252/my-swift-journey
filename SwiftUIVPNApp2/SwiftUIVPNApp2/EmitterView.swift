//
//  EmitterView.swift
//  SwiftUIVPNApp2
//
//  Created by Luan Nguyen on 27/12/2020.
//

import SwiftUI

struct EmitterView: UIViewRepresentable {
    let width: CGFloat
    let height: CGFloat
    
    func makeUIView(context: Context) -> some UIView {
        let size = CGSize(width: width, height: height)
        let host = UIView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        
        let emitterLayer = CAEmitterLayer()
        emitterLayer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        host.layer.addSublayer(emitterLayer)
        host.layer.masksToBounds = true
        
        emitterLayer.emitterShape = .circle
        emitterLayer.emitterPosition = CGPoint(x: size.width/2, y: size.height/2)
        emitterLayer.emitterSize = size
        
        let emitterCell = EmitterCell().content(.circle(20))
        emitterCell.color = UIColor.white.cgColor
        emitterCell.birthRate = 25
        emitterCell.lifetime = 4.0
        emitterCell.scale = 0.01
        emitterCell.alphaRange = 0.1
        emitterCell.alphaSpeed = 0.3
        
        emitterLayer.emitterCells = [emitterCell]
        
        return host
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

fileprivate extension EmitterCell.Content {
    var image: UIImage {
        switch self {
        case let .image(image):
            return image
        case let .circle(radius):
            let size = CGSize(width: radius * 2, height: radius * 2)
            return UIGraphicsImageRenderer(size: size).image { context in
                context.cgContext.setFillColor(UIColor.white.cgColor)
                context.cgContext.addPath(CGPath(ellipseIn: CGRect(origin: .zero, size: size), transform: nil))
                context.cgContext.fillPath()
            }
        }
    }
}

class EmitterCell: CAEmitterCell {
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public enum Content {
        case image(UIImage)
        case circle(CGFloat)
    }
    
    dynamic func content(_ content: Content) -> Self {
        self.contents = content.image.cgImage
        return self
    }
}
