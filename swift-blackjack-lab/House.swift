//
//  House.swift
//  swift-blackjack-lab
//
//  Created by ac on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class House:Player {
    //var tokens: UInt:UInt
    var mustHit:Bool {
        return handscore < 17
    }

    override init(name:String) {
        super.init(name: name)
        //self.name = name
        tokens = 1000
    }

}
