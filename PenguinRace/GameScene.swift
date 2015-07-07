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
    let baseSpeed: CGFloat = 3
    var speed1: CGFloat = 2
    var speed2: CGFloat = 2
    var lastTime: NSTimeInterval = 0
    override init(size: CGSize) {
        super.init(size:size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToView(view: SKView) {
        self.physicsBody = SKPhysicsBody(edgeLoopFromRect: self.frame)
        
        screen1 = GameScreenNode(gameWindow:self.frame, pixelWindow:CGSize(width: 2*self.frame.size.width, height: 2 * self.frame.size.height))
        screen2 = GameScreenNode(gameWindow:self.frame, pixelWindow:CGSize(width: 2*self.frame.size.width, height: 2 * self.frame.size.height))
        screen2?.screenNode.position = CGPoint(x:self.frame.size.width, y:self.frame.size.height)
        screen2?.screenNode.zRotation = CGFloat(M_PI)
        self.addChild(screen1!.screenNode)
        self.addChild(screen2!.screenNode)
    }
   
    override func update(currentTime: CFTimeInterval) {
        if lastTime == 0 {
            lastTime = currentTime-0.01
        }
        let elapsedTime = CGFloat(currentTime - lastTime)
        if speed1 < baseSpeed {
            speed1 *= 1.01
        } else if speed1 > baseSpeed {
            speed1 *= 0.999
        }
        if speed2 < baseSpeed {
            speed2 *= 1.01
        } else if speed2 > baseSpeed {
            speed2 *= 0.999
        }
        pos1 += elapsedTime*speed1
        pos2 += elapsedTime*speed2
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
