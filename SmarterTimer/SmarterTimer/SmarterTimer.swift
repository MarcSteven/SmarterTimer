//
//  SmarterTimer.swift
//  SmarterTimer
//
//  Created by Marc Zhao on 2019/10/31.
//  Copyright © 2019 Marc Zhao. All rights reserved.
//

import Foundation


public  extension Timer {
    
    //MARK: - schedule timers
    
    @discardableResult
    class func after(_ interval:TimeInterval,
                     _ block:@escaping () ->Void) ->Timer {
        let timer = Timer.after(interval, block)
        timer.start()
        return timer
        
    }
    //Create a timer that will call block repeated in specified time intervals
    
    //Note: the timer won't fire until it is scheduled on the run loop
    class func new(every interval:TimeInterval,
                   _ block:@escaping ()->Void) ->Timer {
        return CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, interval, 0, 0) { _ in
            block()
        }
    }
    @nonobjc class func new(every interval:TimeInterval,
                            _ block:@escaping (Timer)->Void) ->Timer {
        var timer:Timer!
        timer = CFRunLoopTimerCreateWithHandler(kCFAllocatorDefault, CFAbsoluteTimeGetCurrent() + interval, interval, 0, 0, { _ in
            block(timer)
        })
        return timer
    }
//    schedule the timer on runloop
    
    //By default, the timer is scheduled on the current run loop for the default mode
    //Specify "runloop or modes to override these defaults
    func start(runloop:RunLoop = .current,
               modes:RunLoop.Mode...) {
        let modes = modes.isEmpty ? [.default]: modes
        for mode in modes {
            runloop.add(self, forMode: mode)
        }
    }
}
