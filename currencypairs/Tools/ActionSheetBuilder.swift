import Foundation
import Sheeeeeeeeet

class ActionSheetBuilder {
    static func setSheetAppearance() {
        ActionSheet.applyAppearance(MenuAppearance())
    }

    static func buildCurrenciesSheet(
        baseCurrency currentBaseCurrency: Currency,
        secondCurrency currentSecondCurrency: Currency,
        onSelect: @escaping (CurrencyPair) -> Void
    ) -> ActionSheet {

        var items: [SingleSelectItem] = Array()
        for baseCurrency in Currency.allCases {
            for secondCurrency in Currency.allCases {
                guard baseCurrency != secondCurrency else {
                    continue
                }

                items.append(SingleSelectItem(
                    title: "\(baseCurrency.rawValue) → \(secondCurrency.rawValue)",
                    isSelected: baseCurrency == currentBaseCurrency && secondCurrency == currentSecondCurrency,
                    value: CurrencyPair(baseCurrency, secondCurrency)))
            }
        }

        let menu = Menu(items: items)

        let menuSheet = menu.toActionSheet { sheet, item in
            guard let currencyPair = item.value as? CurrencyPair else {
                return
            }
            onSelect(currencyPair)
        }

        menuSheet.minimumContentInsets = UIEdgeInsets()

        return menuSheet
    }
}
