import Foundation

class State {
    var baseCurrency: Currency
    var secondCurrency: Currency
    var todayRates: ApiDataModel?
    var yesterdayRates: ApiDataModel?

    init (
        baseCurrency: Currency,
        secondCurrency: Currency
    ) {
        self.baseCurrency = baseCurrency
        self.secondCurrency = secondCurrency
    }
}
