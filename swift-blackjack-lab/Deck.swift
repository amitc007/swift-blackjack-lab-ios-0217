//
//  Deck.swift
//  swift-blackjack-lab
//
//  Created by ac on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Deck {
    private var dealtCards:[Card]
    private var unDealtCards:[Card]
    
    init() {
        let card = Card(suit: "♥︎",rank: "A")
        dealtCards = []
        unDealtCards = []
        for s in card.validSuits() {
            for r in card.validRanks() {
               unDealtCards.append(Card(suit: s,rank: r))
            }
        }
    }
    
    var description:String {
        return "Cards Dealt: \(dealtCards.count)\n" + descriptionFor(cardArray: dealtCards) + "Cards Remaining: \(unDealtCards.count)\n" + descriptionFor(cardArray: unDealtCards)
        
    }
    
    func drawCard()->Card {
        let  card = unDealtCards.removeLast()
        dealtCards.append(card)
        return card
    }
    
    func shuffle() {
        var tmpCard = Card(suit: "♥︎",rank: "A")
        unDealtCards =  dealtCards + unDealtCards
        dealtCards = []
        for c in 0...26 {
            let idx = Int(arc4random_uniform(26)+26)
            print("shuffle c=\(c) idx=\(idx)")
            //let card = dealtCards[c]
            tmpCard = unDealtCards[idx]
            unDealtCards[idx] = unDealtCards[c]
            unDealtCards[c] = tmpCard
            
        }
        //dealtCards = []
    }
    
    
}
