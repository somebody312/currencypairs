import Foundation

class RatesHelper {

    static func getRate(data: ApiDataModel?, secondCurrency: Currency) -> Float {
        var result = Float()
        switch secondCurrency {
        case .usd:
            result = data?.rates.usd ?? 0.0
        case .rub:
            result = data?.rates.rub ?? 0.0
        case .eur:
            result = data?.rates.eur ?? 0.0
        }

        return result.rounded(toDigits: 3)
    }

    static func getPercentSinceYesterday(todayData: ApiDataModel?, yesterdayData: ApiDataModel?, secondCurrency: Currency) -> Int {
        let todayRate = getRate(data: todayData, secondCurrency: secondCurrency)
        let yesterdayRate = getRate(data: yesterdayData, secondCurrency: secondCurrency)

        guard yesterdayRate != 0 else {
            return 0
        }

        let percent = (((todayRate / yesterdayRate) - 1) * 100).rounded()

        return Int(percent)
    }
}
