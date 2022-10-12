//
//  Star.swift
//  testando swiftui
//
//  Created by Samuel Brasileiro on 12/10/22.
//

import struct CoreGraphics.CGFloat
import Foundation

class Star: Identifiable {
    var x: CGFloat
    var y: CGFloat
    let size: CGFloat
    var vx: CGFloat = 0
    var vy: CGFloat = 0
    var timer: Timer?
    
    init(x: CGFloat = 0,
         y: CGFloat = 0,
         size: CGFloat = 40) {
        self.x = x
        self.y = y
        self.size = size
    }
    
    func run(_ velocity: CGFloat) {
        x += vx * velocity
        y += vy * velocity
    }
}
