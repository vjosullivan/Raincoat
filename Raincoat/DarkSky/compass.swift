//
//  compass.swift
//  Raincoat
//
//  Created by Vincent O'Sullivan on 05/10/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import Foundation

enum Compass: String {
    case north     = "north"
    case northEast = "north east"
    case east      = "east"
    case southEast = "south east"
    case south     = "south"
    case southWest = "south west"
    case west      = "west"
    case northWest = "north west"
    
    init(degrees: Double) {
        let d = remainder(degrees, 360.0)
        switch true {
        case d >= 22.5 && d < 67.5:
            self = .northEast
        case d >= 67.5 && d < 112.5:
            self = .east
        case d >= 112.5 && d < 157.5:
            self = .southEast
        case d >= 157.5 || d <= -157.5:
            self = .south
        case d <= -112.5 && d > -157.5:
            self = .southWest
        case d <= -67.5 && d > -112.5:
            self = .west
        case d <= -22.5 && d > -67.5:
            self = .northWest
        default:
            self = .north
        }
    }
}

//let n = Compass(degrees: 1.5)
