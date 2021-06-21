//
//  Game.swift
//  DurakGame
//
//  Created by Дима Носко on 16.06.21.
//

import Foundation

protocol GameCompatible {
    var players: [Player] { get set }
}

struct Game: GameCompatible {
    var players: [Player]
}

extension Game {

    func defineFirstAttackingPlayer(players: [Player]) -> Player? {
        if !players.isEmpty {
            var playerWithLowestTrump : (player: Player, lowestTrump: Int)? = nil
            for player in players {
                if player.hand != nil {
                    for card in player.hand! {
                        if card.isTrump {
                            if playerWithLowestTrump == nil {
                                playerWithLowestTrump = (player,card.value.rawValue)
                            }else{
                                if card.value.rawValue < playerWithLowestTrump!.lowestTrump {
                                    playerWithLowestTrump = (player,card.value.rawValue)
                                }
                            }
                            
                        }
                    }
                }
            }
            return playerWithLowestTrump?.player
        }else{
            return nil
        }
    }
}
