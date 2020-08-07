import Foundation

protocol DataFetcherProtocol {
    func getCurrencyPair(
        baseCurrency: Currency,
        secondCurrency: Currency,
        date: Date,
        onSuccess: @escaping (ApiDataModel) -> Void,
        onFail: @escaping (String?) -> Void
    )
}