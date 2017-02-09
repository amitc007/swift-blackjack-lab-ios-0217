//
//  Player.swift
//  swift-blackjack-lab
//
//  Created by ac on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Player {
    var name:String
    var cards:[Card] = []
    var handscore:UInt {  return calcValue() }
    
    var blackjack:Bool {
        return  ( handscore == 21 && cards.count == 2 )
    }
    var busted:Bool { return handscore > 21 }
    var stayed:Bool = false
    var mayHit:Bool { return !busted && !blackjack && !stayed }
    var tokens:UInt
    var description:String {
        var desp = name + "\n cards: \(String(cards.count))" + "\n handscore: \(handscore)"
        desp += "\n blackjack: \(blackjack)" + "\nbusted: \(busted)" + "\nstayed: \(stayed)" +
        "\nmayHit: \(mayHit)" + "\ntokens: \(tokens) "
        
        return desp
    }
    
    private func calcValue()->UInt {
        var value:UInt = 0
        var hasAce = false
        for c in cards {
            if c.rank == "A" {  hasAce = true  }
            value += c.cardValue
        }
        
        if hasAce {
            if (value + 10) <= 21 {
                value = value + 10
            }
        }
        return value
    }
    
    init(name:String) {
        self.name = name
        self.tokens = 100
    }
    
    func canPlace(bet:UInt)->Bool {
       return tokens >= bet
    }
    
    func didWin(bet:UInt) {
        tokens += bet
    }
    
    func didLose(bet:UInt) {
        return tokens -= bet
    }
}
