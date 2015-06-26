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
    
    let screen:SKSpriteNode
    var penguin1:SKSpriteNode = SKSpriteNode(imageNamed: "Pinguin")
    var penguin2:SKSpriteNode = SKSpriteNode(imageNamed: "Pinguin")
    let gameWindow:CGRect
    
    init(gameWindow gWindow:CGRect) {
        gameWindow = gWindow
        screen = SKSpriteNode(imageNamed: "mountainbg")
        screen.xScale = gameWindow.size.height / screen.size.height
        screen.yScale = screen.xScale
        screen.position = CGPoint(x:CGRectGetMidX(gameWindow),
            y:CGRectGetMidY(gameWindow))
        
        setupPenguin(penguin1)
        setupPenguin(penguin2)
        
        screen.addChild(penguin1)
        screen.addChild(penguin2)
    }
    func setupPenguin(penguin:SKSpriteNode) {
        penguin.xScale = gameWindow.size.height/3/penguin.size.height
        penguin.yScale = penguin.xScale
        penguin.position = CGPoint(x:-screen.size.width/2/screen.xScale+50,
            y:-screen.size.height/2/screen.yScale+70)
    }
    
    // from 0 = start to 100=finish
    func moveToPosition(x:Double) {
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}