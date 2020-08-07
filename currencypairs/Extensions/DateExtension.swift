import Foundation

extension Date {

    // In fact, it returns the day before yesterday
    // It was made because API returns yesterday's rates on the today's request
    // To make it more visible to work let's pretend the rates for the day before yesterday are actually for yesterday
    func yesterday() -> Date {
        var dateComponent = DateComponents()
        dateComponent.day = -2
        return Calendar.current.date(byAdding: dateComponent, to: Date())!
    }

    func toApiCompatibleFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: self)
    }
}
