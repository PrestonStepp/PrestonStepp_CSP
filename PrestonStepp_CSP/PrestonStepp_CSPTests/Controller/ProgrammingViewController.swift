//
//  ProgrammingViewController.swift
//  PrestonStepp_CSP
//
//  Created by Stepp, Preston on 10/26/17.
//  Copyright © 2017 CTEC. All rights reserved.
//

import UIKit
import SpriteKit

public class ProgrammingViewontroller: UIViewController
{
    //MARK: UI Components
    
    override public func viewDidLoad() -> Void
    {
        super.viewDidLoad()
        let gameScene  = StartScne(size: view.bounds.size)
        let gameView = view as! SKView
        
        gameView.showFPS = true
        gameView.showsNodeCount = true
        gameView.ignoresSiblingOrder = true
        
        gameScene.scaleMode = resizeFill
        gameView.presentScene(gameScene)
    }
}
