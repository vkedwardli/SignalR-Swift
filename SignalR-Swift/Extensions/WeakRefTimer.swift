//
//  TimerProxy.swift
//  LiveCasino
//
//  Created by Vai Kong Edward Li on 3/8/2018.
//  Copyright © 2018 Provido Global Limited. All rights reserved.
//

import Foundation

class WeakRefTimer {
    var timer: Timer!
    var timerHandler: (() -> Void)?
    
    init(withInterval interval: TimeInterval, repeats: Bool, timerHandler: (() -> Void)?) {
        self.timerHandler = timerHandler
        timer = Timer.scheduledTimer(timeInterval: interval,
                                     target: self,
                                     selector: #selector(timerDidFire(_:)),
                                     userInfo: nil,
                                     repeats: repeats)
    }
    
    @objc func timerDidFire(_ timer: Timer) {
        timerHandler?()
    }
    
    func invalidate() {
        timer.invalidate()
    }
}
