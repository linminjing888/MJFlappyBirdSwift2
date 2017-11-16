//
//  GameViewController.swift
//  MJFlappyBirdDemo
//
//  Created by YXCZ on 2017/11/7.
//  Copyright © 2017年 JingJing_Lin. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    fileprivate var player: MusicPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            player = try MusicPlayer(fileName: "Pamgaea", type: "mp3")
            player?.play()
        } catch _ {
            print("Error Play")
        }
        
        if let view = self.view as! SKView? {
            
            let scene = GameScene(size:view.bounds.size)
                scene.scaleMode = .aspectFill
                view.presentScene(scene)
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
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
