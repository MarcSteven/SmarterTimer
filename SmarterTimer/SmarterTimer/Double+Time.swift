//
//  Double+Time.swift
//  SmarterTimer
//
//  Created by Marc Zhao on 2019/10/31.
//  Copyright © 2019 Marc Zhao. All rights reserved.
//

import Foundation

public extension Double {
    
    var millisecond:TimeInterval {return self / 1_000}
    var milliseconds:TimeInterval { return self / 1000}
    var ms:TimeInterval {return self / 1000}
    var second:TimeInterval { return self}
    var seconds:TimeInterval {return self}
    var minute:TimeInterval { return self * 60}
    var minutes:TimeInterval {return self * 60}
    var hour:TimeInterval { return self * 60 * 60}
    var hours:TimeInterval { return self * 60 * 60}
    var day:TimeInterval {return self * 60 * 60 * 24}
    var days:TimeInterval {return self * 60 * 60 * 24}
}
