//
//  GameScreenNode.swift
//  PenguinRace
//
//  Created by John Goering on 26/06/15.
//  Copyright © 2015 John Goering. All rights reserved.
//

import UIKit
import SpriteKit

class GameScreenNode {
    
    let background:SKSpriteNode
    let screenNode:SKCropNode
    var mainPenguin:SKSpriteNode = SKSpriteNode(imageNamed: "Pinguin")
    var otherPenguin:SKSpriteNode = SKSpriteNode(imageNamed: "Pinguin")
    let gameWindow:CGRect
    
    init(gameWindow gWindow:CGRect, pixelWindow:CGSize) {
        gameWindow = gWindow
        background = SKSpriteNode(imageNamed: "mountainbg")
        background.xScale = gameWindow.size.height / background.size.height
        background.yScale = background.xScale
        background.position = CGPoint(x:0,y:CGRectGetMidY(gameWindow))
        screenNode = SKCropNode()

        setupPenguin(mainPenguin, offset: 60)
        setupPenguin(otherPenguin, offset: 80)
        
        background.addChild(otherPenguin)
        background.addChild(mainPenguin)

        screenNode.addChild(background)
        let maskNode = SKSpriteNode(color: UIColor.blackColor(), size: CGSize(width: pixelWindow.width/2,height:pixelWindow.height))
        screenNode.maskNode = maskNode
        moveToPosition(0)
    }
    func setupPenguin(penguin:SKSpriteNode, offset:CGFloat) {
        penguin.xScale = gameWindow.size.height/3/penguin.size.height
        penguin.yScale = penguin.xScale
        let newx = -background.size.width/2/background.xScale+50
        let newy = -background.size.height/2/background.yScale+offset
        penguin.position = CGPoint(x:newx,y:newy)
    }
    func movePenguinTo(p:SKSpriteNode, _ x:CGFloat) {
        var newx = -background.size.width/2/background.xScale+50
        newx += (x/100.0)*(background.size.width/background.xScale-100)
        p.position = CGPoint(x:newx,y:mainPenguin.position.y)
    }
    // from 0 = start to 100=finish
    func moveToPosition(x:CGFloat) {
        movePenguinTo(mainPenguin, x)
        var backgroundX = background.size.width/2
        backgroundX += (x/100.0)*(gameWindow.size.width-background.size.width/background.xScale)
        NSLog("backgroundWidth: \(background.size.width) xScale: \(background.xScale) origBGW: \(background.size.width/background.xScale) gameWindow: \(gameWindow.size.width) backgroundX: \(backgroundX)")
        background.position = CGPoint(x:backgroundX, y:background.position.y)
    }
    func moveOtherToPosition(x:CGFloat) {
        movePenguinTo(otherPenguin, x)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}