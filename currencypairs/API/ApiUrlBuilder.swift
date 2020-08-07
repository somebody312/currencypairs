import Foundation

class ApiUrlBuilder : ApiUrlBuilderProtocol {
    func getRatesUrl(baseCurrency: String, secondCurrency: String, date: Date) -> String {
        return "https://api.exchangeratesapi.io/\(date.toApiCompatibleFormat())?base=\(baseCurrency)&symbols=\(secondCurrency)"
    }
}