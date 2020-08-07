import Foundation

struct ApiDataModel : Decodable {
    let rates : ApiRatesModel
    let baseCurrency : String
    let date : String

    enum CodingKeys : String, CodingKey {
        case rates
        case baseCurrency = "base"
        case date
    }
}