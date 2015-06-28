//
//  GameScene.swift
//  PenguinRace
//
//  Created by John Goering on 21/06/15.
//  Copyright (c) 2015 John Goering. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var screen1: GameScreenNode?
    var screen2: GameScreenNode?
    
    override init(size: CGSize) {
        super.init(size:size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        screen1 = GameScreenNode(gameWindow:self.frame, pixelWindow:CGSize(width: view.contentScaleFactor*self.frame.size.width, height: view.contentScaleFactor * self.frame.size.height))
        screen2 = GameScreenNode(gameWindow:self.frame, pixelWindow:CGSize(width: view.contentScaleFactor*self.frame.size.width, height: view.contentScaleFactor * self.frame.size.height))
        screen2?.screenNode.position = CGPoint(x:self.frame.size.width, y:self.frame.size.height)
        screen2?.screenNode.zRotation = CGFloat(M_PI)
        self.addChild(screen1!.screenNode)
        self.addChild(screen2!.screenNode)
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Pinguin")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
