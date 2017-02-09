//
//  Dealer.swift
//  swift-blackjack-lab
//
//  Created by ac on 2/8/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

class Dealer {
    var deck:Deck = Deck()
    var house = House(name: "House")
    var player = House(name: "Player")
    var bet:UInt = 0
    
    func place(bet:UInt)->Bool {
        if house.canPlace(bet: bet) && player.canPlace(bet: bet) {
            self.bet = bet
            return true
        }
        return false
    }
    
    func deal() {
        //New deal so set stayed to false  & empty cards
        house.stayed = false
        player.stayed = false
        house.cards = []
        player.cards = []
        for _ in 1...2 {
            house.cards.append(deck.drawCard())
            player.cards.append(deck.drawCard())
        }
    }
    
    func turn(house:House) {
        if house.mayHit {
            if house.mustHit {
                house.cards.append(deck.drawCard())
            }
        }
    }
    
    func winner()->String {
        if house.busted || player.blackjack || (player.cards.count >= 5 &&  !player.busted ) || ( player.handscore > house.handscore && house.stayed && player.stayed) {
            return "player"
        }
        else
            if player.busted || house.blackjack || ( player.handscore <= house.handscore && house.stayed && player.stayed) {
               return "house"
        }
        return "no"
    }
    
    func award()->String {
        var msg = "no winner"
        if !player.mayHit || !house.mayHit {

            if winner() == "player"  {
                player.didWin(bet: bet) ; house.didLose(bet: bet);
                msg="player wins"   ;
            }
            else
            if winner() == "house" {
                house.didWin(bet: bet) ; player.didLose(bet: bet) ;
                msg="house wins";
            }
            
        }
        return msg
    }
    
    
}
