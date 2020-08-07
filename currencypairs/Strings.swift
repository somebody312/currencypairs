import Foundation

struct Strings {
    static let ruble = NSLocalizedString("ruble", comment: "Name of the Ruble currency")
    static let dollar = NSLocalizedString("dollar", comment: "Name of the Dollar currency")
    static let euro = NSLocalizedString("euro", comment: "Name of the Euro currency")
    static let yesterdayPercent = NSLocalizedString(
        "Since yesterday %@", 
        comment: "The start of the string about changes in rates since yesterday"
    )
    static let grewBy = NSLocalizedString(" grew by", comment: "rate grew by some percent")
    static let fellBy = NSLocalizedString(" fell by", comment: "rate fell by some percent")
    static let percent = NSLocalizedString(" %d percent", comment: "Percents")
    static let notChanged = NSLocalizedString(
        " did not changed significantly", 
        comment: "Rate did not changed significantly"
    )
    static let updated = NSLocalizedString("UPDATED AT %@", comment: "The time of the last data update")
    static let error = NSLocalizedString(
        "Something goes wrong, please try again", 
        comment: "A message appears when some error has occurred"
    )
}
