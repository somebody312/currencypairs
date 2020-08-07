import Foundation
import Sheeeeeeeeet

class MenuAppearance : ActionSheetAppearance {

    override func apply() {
        super.apply()

        let sheetAppearance = ActionSheetTableView.appearance()
        sheetAppearance.backgroundColor = UIColor.init(rgb: 0x3f4753)
        sheetAppearance.cornerRadius = 0
        sheetAppearance.separatorColor = .black

        let cellAppearance = ActionSheetSingleSelectItemCell.appearance()
        cellAppearance.titleFont = UIFont.init(name: "Lato-Regular", size: 18.0)
        cellAppearance.selectedTitleFont = UIFont.init(name: "Lato-Black", size: 18.0)
        cellAppearance.titleColor = UIColor.init(rgb: 0xffffff).withAlphaComponent(0.7)
        cellAppearance.selectedTitleColor = .white
        cellAppearance.selectedIcon = nil
        cellAppearance.itemTextAlignment = .center
        cellAppearance.height = 60
    }
}