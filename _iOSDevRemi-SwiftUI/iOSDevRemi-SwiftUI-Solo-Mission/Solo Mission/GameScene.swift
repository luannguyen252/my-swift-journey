//
//  GameScene.swift
//  Solo Mission
//
//  Created by daniel.d4 on 23/07/2018.
//  Copyright © 2018 daniel.d4. All rights reserved.
//

import SpriteKit

var gameScore = 0

class GameScene: SKScene, SKPhysicsContactDelegate {


    
    let scoreLabel = SKLabelNode(fontNamed: "GingerPeachyNF")
    
    var livesNumber = 3
    let livesLabel = SKLabelNode(fontNamed: "GingerPeachyNF")
    
    
    var levelNumber = 0
    
   let player = SKSpriteNode(imageNamed:"plyership2")
    
    let bulletSound = SKAction.playSoundFileNamed("bulletSoundsEffect.mp3", waitForCompletion: false)
    
    let explosionSound = SKAction.playSoundFileNamed("Explosion.mp3", waitForCompletion: false)

    let tapToStartLabel = SKLabelNode(fontNamed: "GingerPeachyNf")
    
    
    
    enum gameState{
        case preGame //when the game state is before the start of the game
        case inGame //when the game state is during the game
        case afterGame //when the game state is after the game
    }
    
    var currentGameState = gameState.preGame
    
    
    struct physicsCategories{
        static let None: UInt32 = 0
        static let Player: UInt32 = 0b1 //1
        static let Bullet: UInt32 = 0b10 //2
        static let Enemy: UInt32 = 0b100 //4
        
    }
    
    
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
    return random() * (max - min) + min
    }
    
    
    let gameArea: CGRect
    
    override init(size: CGSize) {
        
        let maxAspectRatio: CGFloat = 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        
        super.init(size: size)


    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func didMove(to view: SKView) {
        
        gameScore = 0
        
        self.physicsWorld.contactDelegate = self
        
        for i in 0...1 {
            
        
        let background = SKSpriteNode(imageNamed:"IMG_9127")
        background.size = self.size
        background.anchorPoint = CGPoint(x: 0.5, y: 0)
        background.position = CGPoint(x: self.size.width/2,
                                      y: self.size.height*CGFloat(i))
        background.zPosition = 0
        background.name = "Background"
        self.addChild(background)
            
        }
        
        player.setScale(0.4)
        player.position = CGPoint(x: self.size.width/2, y: 0 - player.size.height)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = physicsCategories.Player
        player.physicsBody!.collisionBitMask = physicsCategories.None
        player.physicsBody!.contactTestBitMask = physicsCategories.Enemy
        self.addChild(player)
        
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 60
        scoreLabel.fontColor = SKColor.white
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x: self.size.width*0.20, y: self.size.height + scoreLabel.frame.size.height)
        scoreLabel.zPosition = 150
        self.addChild(scoreLabel)
        
        livesLabel.text = "Lives: 3"
        livesLabel.fontSize = 60
        livesLabel.fontColor = SKColor.white
        livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        livesLabel.position = CGPoint(x: self.size.width*0.80, y: self.size.height + livesLabel.frame.size.height)
        livesLabel.zPosition = 100
        self.addChild(livesLabel)
        
        let moveToScreenAction = SKAction.moveTo(y: self.size.height*0.9, duration: 0.3)
        scoreLabel.run(moveToScreenAction)
        livesLabel.run(moveToScreenAction)
        
        tapToStartLabel.text = "Tap To Begin"
        tapToStartLabel.fontSize = 80
        tapToStartLabel.fontColor = SKColor.white
        tapToStartLabel.zPosition = 1
        tapToStartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        tapToStartLabel.alpha = 0
        self.addChild(tapToStartLabel)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        tapToStartLabel.run(fadeInAction)
       
    }
    
    var lastUpdateTime : TimeInterval = 0
    var deltaFrameTime : TimeInterval = 0
    var amountToMovePerSecond : CGFloat = 800.0
    
    override func update(_ currentTime: TimeInterval) {
        
        if lastUpdateTime == 0 {
            lastUpdateTime = currentTime
        }
        else{
            deltaFrameTime = currentTime - lastUpdateTime
            lastUpdateTime = currentTime
        }
        
        let amountToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime)
        
        self.enumerateChildNodes(withName:"Background"){
            background, stop in
            
            if self.currentGameState == gameState.inGame {
            background.position.y -= amountToMoveBackground
            }
            
            if background.position.y < -self.size.height{
                background.position.y += self.size.height*2
            }
        }
        
    }
    
    
    func startGame(){
        
        currentGameState = gameState.inGame
        
        let fadeOutAction = SKAction.fadeIn(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence =  SKAction.sequence([fadeOutAction, deleteAction])
        tapToStartLabel.run(deleteSequence)
        
        let moveShipOntoScreenAction = SKAction.moveTo(y: self.size.height*0.2, duration: 0.5)
        let startLevelAction = SKAction.run(startNewLevel)
        let startGameSequence = SKAction.sequence([moveShipOntoScreenAction, startLevelAction])
        player.run(startGameSequence)
        
        
    }
    
    
    
    
    
    
    
    func loseALife(){
        
        livesNumber -= 1
        livesLabel.text = "livess \(livesNumber)"
        
        let scaleUP = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleUP, scaleDown])
        livesLabel.run(scaleSequence)
        
        if livesNumber == 0{
            runGameOver()
        }
        
    
    }
        
    
    
    func addScore(){
        
        gameScore += 1
        scoreLabel.text = "Score: \(gameScore)"
    
        if gameScore == 5  || gameScore == 10 || gameScore == 30 {
            startNewLevel()
            
        }
        
    }
        func runGameOver(){
            
            currentGameState = gameState.afterGame
            
        self.removeAllActions()
            
        self.enumerateChildNodes(withName: "bullet") {
                bullet, stop in
                bullet.removeAllActions()
            }
            
        self.enumerateChildNodes(withName: "Enemy") {
                enemy, stop in
                enemy.removeAllActions()
            }
            
            let changeSceneAction = SKAction.run(changeScene)
            let waitToChangeScene = SKAction.wait(forDuration: 1)
            let changeSceneSequence = SKAction.sequence([waitToChangeScene, changeSceneAction])
            self.run(changeSceneSequence)
            
        }
    
    func changeScene() {
        
        let sceneToMoveTo = GameOverScene (size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let mytransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: mytransition)
    }
    

    func didBegin(_ contact: SKPhysicsContact) {
        
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
            body1 = contact.bodyA
            body2 = contact.bodyB
        }
        else{
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        if body1.categoryBitMask == physicsCategories.Player && body2.categoryBitMask == physicsCategories.Enemy {
            //if player has hit the enemy
            
            if body1.node != nil {
            spawnExplosion(spawnPosition: body1.node!.position)
            }
            
            if body2.node != nil {
            spawnExplosion(spawnPosition: body2.node!.position)
            }
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
            runGameOver()
        
            
        }
        
        if body1.categoryBitMask == physicsCategories.Bullet && body2.categoryBitMask == physicsCategories.Enemy && (body2.node?.position.y)! < self.size.height {
            //if the bullet has hit the enemy
            
            addScore()
            
            if body2.node != nil {
            spawnExplosion(spawnPosition: body2.node!.position)
            }
            
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
        }
        
        
        
        
    }
    
    func spawnExplosion(spawnPosition: CGPoint){
        
        let explosion = SKSpriteNode(imageNamed: "explosionenmy1")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0)
        self.addChild(explosion)
        
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.1)
        let fadeOut = SKAction.fadeOut(withDuration: 0.1)
        let delete = SKAction.removeFromParent()
        
        let explosionSequence = SKAction.sequence([explosionSound, scaleIn, fadeOut, delete])
        
        explosion.run(explosionSequence)
        
    }
    
    
    
    
    func startNewLevel() {
        
        levelNumber += 1
        
        if self.action(forKey: "spawningEnemies") != nil {
            self.removeAction(forKey: "spawningEnemies")
        }
        
        var levelDuration = TimeInterval()
        
        switch levelNumber {
        case 1: levelDuration = 1.4
        case 2: levelDuration = 1
        case 3: levelDuration = 0.8
        case 4: levelDuration = 0.5
        default:
            levelDuration = 0.5
            print("cannot find level info")
        }
        
        
        
        let spawn = SKAction.run(spawnEnemy)
        let waitToSpawn = SKAction.wait(forDuration: levelDuration)
        let spawnSequence = SKAction.sequence([waitToSpawn, spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawningEnemies")
        
    }
    
    
    
    
    
    func direBullet() {
        
        let bullet = SKSpriteNode(imageNamed: "bullet")
        bullet.name = "bullet"
        bullet.setScale(1)
        bullet.position = player.position
        bullet.zPosition = 1
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)
        bullet.physicsBody!.affectedByGravity = false
        bullet.physicsBody!.categoryBitMask = physicsCategories.Bullet
        bullet.physicsBody!.collisionBitMask = physicsCategories.None
        bullet.physicsBody!.contactTestBitMask = physicsCategories.Enemy
        self.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let deleteBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound, moveBullet, deleteBullet])
        bullet.run(bulletSequence)
        
    }
    
    func spawnEnemy(){
    
        let randomXStart = random(min: gameArea.minX, max: gameArea.maxX)
        let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXEnd, y: -self.size.height * 0.2)
        let enemy = SKSpriteNode(imageNamed: "meteorite2")
        enemy.name = "Enemy"
        enemy.setScale(1.8)
        enemy.position = startPoint
        enemy.zPosition = 2
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = physicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = physicsCategories.None
        enemy.physicsBody!.contactTestBitMask = physicsCategories.Player | physicsCategories.Bullet
        self.addChild(enemy)
        
        let moveEnemy = SKAction.move( to: endPoint, duration: 1.5)
        let deleteEnemy = SKAction.removeFromParent()
        let loseALifeAction = SKAction.run(loseALife)
        let enemySequence = SKAction.sequence([moveEnemy, deleteEnemy, loseALifeAction])
        
        if currentGameState == gameState.inGame{
        enemy.run(enemySequence)
        }
        
        let dx = endPoint.x - startPoint.y
        let dy = endPoint.x - startPoint.y
        let amountToRotate = atan2(dy, dx)
        enemy.zRotation = amountToRotate
    
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.preGame{
            startGame()
        }
        
        else if currentGameState == gameState.inGame{
        direBullet()
        }
        
      
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches {
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            
            if currentGameState == gameState.inGame{
            player.position.x += amountDragged
            }
        
        
            if player.position.x > gameArea.maxX - player.size.width/2{
                player.position.x = gameArea.maxX - player.size.width/2
        
            }
            if player.position.x < gameArea.minX + player.size.width/2{
                player.position.x = gameArea.minX + player.size.width/2
            }
        
    }
    
    }
    
    
    
    
    
    }
    
    

