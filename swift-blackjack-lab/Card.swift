//
//  Card.swift
//  swift-blackjack-lab
//
//  Created by ac on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Card {
    var suit:String
    var rank:String
    var cardLabel:String
    var cardValue:UInt = 0
    var description:String {  return cardLabel    }
    
    
    init(suit:String, rank:String) {
        self.suit = suit
        self.rank = rank
        cardLabel = suit+rank
        cardValue = determineCardValue(rank)
    } //init
    
    func validSuits()->[String] {
        return ["♥︎","♠︎","♦","♣︎"]
    }
    
    func validRanks()->[String] {
        return ["A","2","3","4","5","6","7","8","9","10", "J", "Q", "K"]
    }
    
    func determineCardValue(_ rank:String)->UInt {
        var cvalue:UInt = 0
        switch rank {
        case "A" : cvalue = 1;  break
        case "J", "Q", "K" : cvalue = 10 ; break
        default : cvalue = UInt(rank)!
        }
        return cvalue
    }
    
    enum cardIdx: Int {
        case nA = 1, n2, n3,n4n,n5,n6,n7,n8,n9,n10, nJ, nQ, nK
    }
    
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
    }
}

func descriptionFor(cardArray:[Card])->String {
    var newCardArray:[Card]
    var heart = String(), spade = String(),  club = String(), diamond = String()
    newCardArray = cardArray.sorted(by: {$0.cardValue < $1.cardValue })
    //newCardArray = cardArray.sorted(by: {$0.cardIdx < $1.cardValue })
    for c in newCardArray {
        switch c.suit {
        case "♥︎" : heart = heart + " "+c.cardLabel ; break
        case "♠︎" : spade = spade + " "+c.cardLabel ; break
        case "♣︎" : club = club + " "+c.cardLabel ; break
        case "♦" : diamond = diamond + " "+c.cardLabel ; break
        default: break
        }
    }
    return heart + "\n" + spade + "\n" + club + "\n" + diamond
}


