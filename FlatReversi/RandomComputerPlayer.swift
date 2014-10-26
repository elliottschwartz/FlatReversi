//
//  RandomComputerPlayer.swift
//  MyFirstSpriteKit
//
//  Created by Kodama Yoshinori on 10/17/14.
//  Copyright (c) 2014 Yoshinori Kodama. All rights reserved.
//

import Foundation

class RandomComputerPlayer: Player {

    var level: Int = 0

    override func initialize(level: Int) {
        self.level = level
    }

    override func play() {
        dispatch_async_global({self.think()})
    }

    func think() {
        NSLog("Start thinking")
        var retx = 0
        var rety = 0
        if(level >= 1) {
            if let puttables = playerMediator.getBoardRepresentative()?.getPuttables(self.color) {
                NSLog("puttables are \(puttables.count)")
                if(puttables.count > 0) {
                    let selected = Int(arc4random_uniform((puttables.count - 1) - 0 + 1)) + 0
                    assert(selected < puttables.count, "selected must be less than num of puttables")
                    (retx, rety) = puttables[selected]
                }
            } else {
                assertionFailure("Should not reach this code!")
            }
        } else {

        }

        NSLog("Answer \(retx), \(rety)")
        playerMediator.put(self.color, x: retx, y: rety)
    }
}