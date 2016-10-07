//
//  compass.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 05/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

enum Compass {
    case north
    case south
    case east
    case west
    
    init(degrees: Double) {
        let d = remainder(degrees, 360.0)
        switch true {
        case d > 45.0 && d < 135.0:
            self = .east
        case d < -45.0 && d > -135.0:
            self = .west
        case d >= 135.0 || d <= -135.0:
            self = .south
        default:
            self = .north
        }
    }
}

//let n = Compass(degrees: 1.5)
