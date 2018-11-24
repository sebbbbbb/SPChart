//
//  File.swift
//  SPChart
//
//  Created by Sebastien on 24/11/2018.
//  Copyright © 2018 Sebastien. All rights reserved.
//

import Foundation
import UIKit

class Chart: CustomDebugStringConvertible {
   
    var debugDescription: String {
        var str = ""
        pies.forEach { pie in
            str.append("Pie: \(pie.volume)")
        }
        return str
    }
    
    
    let pies: [Pie]
    
    init(pies: [Pie]) {
        let piesVolumSum = pies.map {$0.volume}.reduce(0, +)
        assert(piesVolumSum == 100, "On doit avoir un volume égale a 1")
        self.pies = pies
    }
}





class Pie {
    let volume: Int
    let color: UIColor
    
    init(volume: Int, color: UIColor) {
        assert(0 < volume && volume <= 100, "Le volume doit être compris entre 0 et 1")
        self.volume = volume
        self.color = color
    }
}
