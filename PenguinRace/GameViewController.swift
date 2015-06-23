//
//  GameViewController.swift
//  PenguinRace
//
//  Created by John Goering on 21/06/15.
//  Copyright (c) 2015 John Goering. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    @IBOutlet weak var skView: SKView!
    @IBOutlet weak var skView2: SKView!
    
    
    override func viewDidLayoutSubviews() {
        if let scene = GameScene(fileNamed:"GameScene") {
            setupView(skView, withScene: scene)
        }
        if let scene2 = GameScene(fileNamed:"GameScene") {
            setupView(skView2, withScene: scene2)
        }
    }
    func setupView(sceneView:SKView!, withScene scene:GameScene) {
        // Configure the view.
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        /* Sprite Kit applies additional optimizations to improve rendering performance */
        sceneView.ignoresSiblingOrder = true
        
        sceneView.presentScene(scene)
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return .AllButUpsideDown
        } else {
            return .All
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    @IBAction func greenButtonPressed(sender: AnyObject) {
        if let p = skView.scene?.childNodeWithName("Penguin") {
            p.position.x += 10
        }
        if let p = skView2.scene?.childNodeWithName("Penguin") {
            p.position.x += 10
        }
    }
}
