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
    var pos1: CGFloat = 0
    var pos2: CGFloat = 0
    var lastTime: NSTimeInterval = 0
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
        if lastTime == 0 {
            lastTime = currentTime
        }
        pos1 += CGFloat(currentTime - lastTime)*5
        pos2 += CGFloat(currentTime - lastTime)*5 / 1.2
        if pos1 >= 100 {
            pos1 = 100
        }
        if pos2 >= 100 {
            pos2 = 100
        }
        screen1?.moveToPosition(pos1)
        screen1?.moveOtherToPosition(pos2)
        screen2?.moveToPosition(pos2)
        screen2?.moveOtherToPosition(pos1)
        lastTime = currentTime
    }
}
