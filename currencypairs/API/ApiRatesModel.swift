import Foundation

struct ApiRatesModel : Decodable {
    let rub: Float?
    let eur: Float?
    let usd: Float?

    enum CodingKeys : String, CodingKey {
        case rub = "RUB"
        case eur = "EUR"
        case usd = "USD"
    }
}