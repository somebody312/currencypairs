import Foundation

class ViewProps {
    var baseCurrency: Currency
    var secondCurrency: Currency
    var rate: Float
    var percentSinceYesterday: Int
    var refreshDate: Date
    var onMenuButtonClick: () -> Void

    public init(
        baseCurrency: Currency,
        secondCurrency: Currency,
        rate: Float,
        percentSinceYesterday: Int,
        refreshDate: Date,
        onMenuButtonClick: @escaping () -> Void
    ) {
        self.baseCurrency = baseCurrency
        self.secondCurrency = secondCurrency
        self.rate = rate
        self.percentSinceYesterday = percentSinceYesterday
        self.refreshDate = refreshDate
        self.onMenuButtonClick = onMenuButtonClick
    }
}
