import Foundation

class CurrencyPair {
    var baseCurrency: Currency
    var secondCurrency: Currency

    init (_ baseCurrency: Currency, _ secondCurrency: Currency) {
        self.baseCurrency = baseCurrency
        self.secondCurrency = secondCurrency
    }
}
