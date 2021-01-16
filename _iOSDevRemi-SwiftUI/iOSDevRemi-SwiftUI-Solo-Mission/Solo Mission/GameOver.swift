//
//  GameOver.swift
//  Solo Mission
//
//  Created by daniel.d4 on 24/07/2018.
//  Copyright © 2018 daniel.d4. All rights reserved.
//

import Foundation
import SpriteKit

let restartLabel = SKLabelNode(fontNamed: "GingerPeachyNF")

class GameOverScene: SKScene{
    
    override func didMove(to view: SKView) {
        
        
        let background = SKSpriteNode(imageNamed: "IMG_9127")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameOverLabel = SKLabelNode(fontNamed: "GingerPeachyNF")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 130
        gameOverLabel.fontColor = SKColor.white
        gameOverLabel.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        let scoreLabel = SKLabelNode(fontNamed: "GingerPeachyNF")
        scoreLabel.text = "score \(gameScore)"
        scoreLabel.fontSize = 90
        scoreLabel.fontColor = SKColor.white
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSaved")
    
        
        
        if gameScore > highScoreNumber {
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSaved")
            
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "GingerPeachyNF")
        highScoreLabel.text = "High Score \(highScoreNumber)"
        highScoreLabel.fontSize = 90
        highScoreLabel.fontColor = SKColor.white
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        self.addChild(highScoreLabel)
        
        
        restartLabel.text = "restart"
        restartLabel.fontSize = 80
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        self.addChild(restartLabel)
        
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            
            let pointOfTouch = touch.location(in: self)
        
            
            if restartLabel.contains(pointOfTouch) {
                
                let sceneToMoveTo = GameScene (size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
               
            }
            
        }
        
        
        }
    }




