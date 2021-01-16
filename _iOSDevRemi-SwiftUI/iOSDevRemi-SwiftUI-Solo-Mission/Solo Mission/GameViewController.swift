//
//  GameViewController.swift
//  Solo Mission
//
//  Created by daniel.d4 on 23/07/2018.
//  Copyright © 2018 daniel.d4. All rights reserved.
//

import UIKit
import SpriteKit


class GameViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = MainMenyScene(size: CGSize(width: 1536, height: 2048))
        // Configure the view.
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        skView.ignoresSiblingOrder = true
        
        /* Set the scale mode to scale to fit in the window */
        scene.scaleMode = .aspectFill
        
        skView.presentScene(scene)
        
        
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
