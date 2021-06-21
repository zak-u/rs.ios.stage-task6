//
//  Player.swift
//  DurakGame
//
//  Created by Дима Носко on 15.06.21.
//

import Foundation

protocol PlayerBaseCompatible {
    var hand: [Card]? { get set }
}

final class Player: PlayerBaseCompatible {
    var hand: [Card]?

    func checkIfCanTossWhenAttacking(card: Card) -> Bool {
        if hand != nil {
            for handCard in hand! {
                if handCard.value.rawValue == card.value.rawValue {
                    return true
                }
            }
            return false
        }else{
            return false
        }
    }

    func checkIfCanTossWhenTossing(table: [Card: Card]) -> Bool {
        if hand != nil {
            for handCard in hand! {
                for card in table.keys {
                    if card.value.rawValue == handCard.value.rawValue {
                        return true
                    }
                }
                for card in table.values {
                    if card.value.rawValue == handCard.value.rawValue {
                        return true
                    }
                }
            }
            return false
        }else{
            return false
        }
    }
}
