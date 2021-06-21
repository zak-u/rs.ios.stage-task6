import Foundation

protocol DeckBaseCompatible: Codable {
    var cards: [Card] {get set}
    var type: DeckType {get}
    var total: Int {get}
    var trump: Suit? {get}
}

enum DeckType:Int, CaseIterable, Codable {
    case deck36 = 36
}

struct Deck: DeckBaseCompatible {

    //MARK: - Properties

    var cards = [Card]()
    var type: DeckType
    var trump: Suit?

    var total:Int {
        return type.rawValue
    }
}

extension Deck {

    init(with type: DeckType) {
        self.type = type
//        var suits = [Suit]()
//        for suit in Suit. {
//            <#code#>
//        }
//        var values = [Value]()
        self.cards = createDeck(suits: Suit.allCases, values: Value.allCases)
    }

    public func createDeck(suits:[Suit], values:[Value]) -> [Card] {
        var newCards = [Card]()
        for suit in suits {
            for value in values {
                newCards.append(Card(suit: suit, value: value))
            }
        }
        return newCards
    }

    public mutating func shuffle() {
        cards.shuffle()
    }

    public mutating func defineTrump() {
        if cards.isEmpty {
            trump = nil
        } else {
            trump = cards.first?.suit
            setTrumpCards(for: trump!)
        }
    }

    public mutating func initialCardsDealForPlayers(players: [Player]) {
        for _ in (1...6) {
            for player in players {
                if player.hand == nil {
                    player.hand = [Card]()
                }
                player.hand?.append(cards.removeFirst())
            }
        }
    }

    public mutating func setTrumpCards(for suit:Suit) {
        for (index, card) in cards.enumerated() {
            if card.suit == suit {
                cards[index].isTrump = true
            }
        }
    }
}

