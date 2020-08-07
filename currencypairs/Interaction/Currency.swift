import Foundation

enum Currency : String, CaseIterable {
    case usd = "USD"
    case eur = "EUR"
    case rub = "RUB"

    init?(id : Int) {
        switch id {
        case 1: self = .usd
        case 2: self = .eur
        case 3: self = .rub
        default: return nil
        }
    }
}