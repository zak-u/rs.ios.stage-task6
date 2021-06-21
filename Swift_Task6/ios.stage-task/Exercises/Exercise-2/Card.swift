import Foundation

protocol CardBaseCompatible: Hashable, Codable {
    var suit: Suit {get}
    var value: Value {get}
    var isTrump: Bool {get}

    func hash(into hasher: inout Hasher)
}

enum Suit: Int, CaseIterable, Codable {
    case clubs
    case spades
    case hearts
    case diamonds
}

enum Value: Int, CaseIterable, Codable {
    case six
    case seven
    case eight
    case nine
    case ten
    case jack
    case queen
    case king
    case ace
}

struct Card: CardBaseCompatible {
    let suit: Suit
    let value: Value
    var isTrump: Bool = false

    func hash(into hasher: inout Hasher) {

    }

    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value && lhs.suit == rhs.suit
    }
}

extension Card {

    func checkIfCanBeat(card: Card) -> Bool {
        if suit.rawValue == card.suit.rawValue && value.rawValue > card.value.rawValue  {
            return true
        }else if isTrump && !card.isTrump {
            return true
        }
        return false
    }
    
//    func checkSuit(card: Card) -> Bool {
//        if suit.rawValue == card.suit.rawValue {
//            return true
//        }else{
//            return false
//        }
//    }

    func checkValue(card: Card) -> Bool {
        return false
    }
}
