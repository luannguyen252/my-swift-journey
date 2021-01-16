//
//  mainMenuScene.swift
//  Solo Mission
//
//  Created by daniel.d4 on 26/07/2018.
//  Copyright © 2018 daniel.d4. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenyScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "IMG_9127")
        background.size = self.size
        background.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameName1 = SKLabelNode(fontNamed: "GingerPeachyNF")
        gameName1.text = "solo"
        gameName1.fontSize = 130
        gameName1.fontColor = SKColor.white
        gameName1.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "GingerPeachyNF")
        gameName2.text = "Mission"
        gameName2.fontSize = 150
        gameName2.fontColor = SKColor.white
        gameName2.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.625)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        
        let startGame = SKLabelNode(fontNamed: "Ginger Peachy NF")
        startGame.text = "Start Game"
        startGame.fontSize = 100
        startGame.fontColor = SKColor.white
        startGame.position = CGPoint(x: self.size.width*0.5, y: self.size.height*0.4)
        startGame.zPosition = 1
        startGame.name = "startButtom"
        self.addChild(startGame)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
            
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "startButtom"{
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
            
        }
    }
    
    
}




