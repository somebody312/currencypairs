import Foundation

protocol ApiUrlBuilderProtocol {
    func getRatesUrl(baseCurrency: String, secondCurrency: String, date: Date) -> String
}