//
//  TFSwipeShrinkView.swift
//  PinTube
//
//  Created by Daval Cato on 9/12/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit


class TFSwipeShrinkView: UIView, UIGestureRecognizerDelegate {
    
    var initialCenter: CGPoint?
    var finalCenter: CGPoint?
    var initialSize: CGSize?
    var finalSize: CGSize?
    var firstX: CGFloat = 0, firstY: CGFloat = 0
    var aspectRatio: CGFloat = 0.5625
    
    var rangeTotal: CGFloat!
    var widthRange: CGFloat!
    var centerXRange: CGFloat!
    
    // Should be called when making view programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initGestures()
}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initGestures() {
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(TFSwipeShrinkView.panning))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        self.addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(TFSwipeShrinkView.tapped))
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        tapGesture.delegate = self
        
    }
    
    /// Method to set up initial and final positions of view
    func configureSizeAndPosition(parentViewFrame: CGRect) {
        
        self.initialCenter = self.center
        self.finalCenter = CGPoint(x: parentViewFrame.size.width - parentViewFrame.size.width/4, y: parentViewFrame.size.height - (self.frame.size.height/4) - 2)
        
        initialSize = self.frame.size
        finalSize = CGSize(width: parentViewFrame.size.width/2 - 10, height: (parentViewFrame.size.width/2 - 10) * aspectRatio)
        
        // Set common range totals once
        rangeTotal = finalCenter!.y - initialCenter!.y
        widthRange = initialSize!.width - finalSize!.width
        centerXRange = finalCenter!.x - initialCenter!.x
    }
    
    @objc func panning(panGesture: UIPanGestureRecognizer) {
        let translatedPoint = panGesture.translation(in: self.superview!)
        var gestureState = panGesture.state
        
        let yChange = panGesture.view!.center.y + translatedPoint.y
        if yChange < initialCenter!.y {
            gestureState = UIGestureRecognizer.State.ended
            
        } else if yChange >= finalCenter!.y {
            gestureState = UIGestureRecognizer.State.ended
            
        }
        
        if gestureState == UIGestureRecognizer.State.began || gestureState == UIGestureRecognizer.State.changed  {
            
            // modify size as view is panned down
            let progress = ((panGesture.view!.center.y - initialCenter!.y) / rangeTotal)
            
            let invertedProgress = 1 - progress
            let newWidth = finalSize!.width + (widthRange * invertedProgress)
            
            panGesture.view?.frame.size = CGSize(width: newWidth, height: newWidth * aspectRatio)
            
            // ensure center x value moves along with size change
            let finalX = initialCenter!.x + (centerXRange * progress)
            
            panGesture.view?.center = CGPoint(x: finalX, y: panGesture.view!.center.y + translatedPoint.y)
            panGesture.setTranslation(CGPoint(x: 0, y: 0), in: self.superview)
            
        } else if gestureState == UIGestureRecognizer.State.ended {
            
            let topDistance = yChange - initialCenter!.y
            let bottomDistance = finalCenter!.y - yChange
            
            var chosenCenter: CGPoint = .zero
            var chosenSize: CGSize = .zero
            self.isUserInteractionEnabled = false
            
            if topDistance > bottomDistance {
                // animate to bottom
                chosenCenter = finalCenter!
                chosenSize = finalSize!
                
            } else {
                // animate to top
                chosenCenter = initialCenter!
                chosenSize = initialSize!
            }
            
            if panGesture.view?.center != chosenCenter {
                UIView.animate(withDuration: 0.4, animations: {
                    panGesture.view?.frame.size = chosenSize
                    panGesture.view?.center = chosenCenter
                    
                }, completion: {(done: Bool) in
                    self.isUserInteractionEnabled = true
                })
            } else {
                self.isUserInteractionEnabled = true
            }
        }
        
    }
    
    @objc func tapped(tapGesture: UITapGestureRecognizer) {
        
        if tapGesture.view?.center == self.finalCenter {
            self.isUserInteractionEnabled = false
            UIView.animate(withDuration: 0.4, animations: {
                tapGesture.view?.frame.size = self.initialSize!
                tapGesture.view?.center = self.initialCenter!
                
            }, completion: {(done: Bool) in
                self.isUserInteractionEnabled = true
            })
        }
        
    }
    
    private func gestureRecognizer(gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
    
}























