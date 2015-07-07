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
    var scene:GameScene? = nil
    
    override func viewDidLayoutSubviews() {
        scene = GameScene(size: skView.bounds.size)
        setupView(skView, withScene: scene!)
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
            return .Portrait
        } else {
            return .Portrait
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
        scene?.speed1 += 0.25
    }
}
