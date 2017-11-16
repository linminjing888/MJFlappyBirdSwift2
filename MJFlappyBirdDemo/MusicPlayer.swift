//
//  File.swift
//  MJFlappyBirdDemo
//
//  Created by YXCZ on 2017/11/13.
//  Copyright © 2017年 JingJing_Lin. All rights reserved.
//

import Foundation
import AVFoundation

enum MusicPlayerError : Error {
    case resourceNotFound
}

class MusicPlay {
    /// 单例
    fileprivate var player: AVAudioPlayer? = nil
    
    /// 初始化
    init(fileName:String,type:String) throws {
        if let resource = Bundle.main.path(forResource: fileName, ofType: type) {
            let url = URL(fileURLWithPath: resource)
            player = try AVAudioPlayer(contentsOf: url)
            player?.numberOfLoops = -1
            player?.prepareToPlay()
        }else{
            throw MusicPlayerError.resourceNotFound
        }
    }
    
    /// 播放
    func play(){
        player?.play()
    }
    /// 停止
    func stop() {
        player?.stop()
    }
}
