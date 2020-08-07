import Foundation
import SnapKit

class MainView : UIView, MainViewProtocol {

    private var safeAreaTopPadding: CGFloat = 0.0
    private var safeAreaBottomPadding: CGFloat = 0.0

    private var currenciesLabel = UILabel()
    private var rateLabel = UILabel()
    private var percentSinceYesterdayLabel = UILabel()
    private var updateTimeLabel = UILabel()
    private var menuButton = UIButton()

    private var parentView: UIView?
    private var props: ViewProps?

    func setParentView(view: UIView) {
        self.parentView = view

        initView()
        placeView()
    }

    private func initView() {
        self.backgroundColor = .white

        currenciesLabel.font = UIFont.init(name: "Lato-Bold", size: 22.0)
        currenciesLabel.textColor = UIColor.init(rgb: 0x3f4753).withAlphaComponent(0.7)

        rateLabel.font = UIFont.init(name: "Lato-Regular", size: 104.0)
        rateLabel.textColor = UIColor.init(rgb: 0x3f4753)

        percentSinceYesterdayLabel.font = UIFont.init(name: "Lato-MediumItalic", size: 22.0)
        percentSinceYesterdayLabel.textColor = UIColor.init(rgb: 0x7ed321)
        percentSinceYesterdayLabel.textAlignment = .center
        percentSinceYesterdayLabel.numberOfLines = 0

        updateTimeLabel.font = UIFont.init(name: "Lato-Black", size: 14.0)
        updateTimeLabel.textColor = UIColor.init(rgb: 0x3f4753).withAlphaComponent(0.4)

        menuButton.setImage(UIImage(named: "icMenu"), for: .normal)
        menuButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)

        getSafeAreaPaddings()
    }

    private func placeView() {
        self.parentView?.addSubview(self)
        self.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(safeAreaTopPadding)
            make.bottom.equalToSuperview().offset(-safeAreaBottomPadding)
            make.left.right.equalToSuperview()
        }

        self.addSubview(currenciesLabel)
        currenciesLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(140)
            make.centerX.equalToSuperview()
        }

        self.addSubview(rateLabel)
        rateLabel.snp.makeConstraints { make in
            make.top.equalTo(currenciesLabel.snp.bottom)
            make.centerX.equalToSuperview()
        }

        self.addSubview(percentSinceYesterdayLabel)
        percentSinceYesterdayLabel.snp.makeConstraints { make in
            make.top.equalTo(rateLabel.snp.bottom)
            make.left.equalToSuperview().offset(70)
            make.right.equalToSuperview().offset(-70)
            make.centerX.equalToSuperview()
        }

        self.addSubview(updateTimeLabel)
        updateTimeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-30)
            make.centerX.equalToSuperview()
        }

        self.addSubview(menuButton)
        menuButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(updateTimeLabel)
        }
    }

    private func getSafeAreaPaddings() {
        let window = AppDelegate.current?.window
        safeAreaTopPadding = window?.safeAreaInsets.top ?? 0
        safeAreaBottomPadding = window?.safeAreaInsets.bottom ?? 0
    }

    func applyProps(props: ViewProps) {
        self.props = props
        currenciesLabel.text = "\(props.baseCurrency.rawValue) → \(props.secondCurrency.rawValue)"

        rateLabel.text = NumberFormatter.localizedString(from: props.rate as NSNumber, number: .decimal)

        percentSinceYesterdayLabel.text = getPercentLabelText(
            baseCurrency: props.baseCurrency,
            percentSinceYesterday: props.percentSinceYesterday
        )
        percentSinceYesterdayLabel.textColor = getPercentLabelColor(percent: props.percentSinceYesterday)

        let updatedAtString = String.localizedStringWithFormat(
            Strings.updated,
            DateFormatter.localizedString(from: props.refreshDate, dateStyle: .none, timeStyle: .short)
        )
        
        let attributedUpdatedAtString = NSMutableAttributedString(string: updatedAtString)
        attributedUpdatedAtString.addAttribute(
            NSAttributedString.Key.kern,
            value: 1.25,
            range: NSMakeRange(0, attributedUpdatedAtString.length)
        )

        updateTimeLabel.attributedText = attributedUpdatedAtString

        menuButton.addTarget(self, action: #selector(onMenuButtonClick), for: UIControl.Event.touchUpInside)
    }

    private func getPercentLabelText(baseCurrency: Currency, percentSinceYesterday: Int) -> String {
        var result = String.localizedStringWithFormat(Strings.yesterdayPercent, getCurrencyName(currency: baseCurrency))

        if percentSinceYesterday != 0 {
            if percentSinceYesterday > 0 {
                result += Strings.grewBy
            } else {
                result += Strings.fellBy
            }

            result += String.localizedStringWithFormat(Strings.percent, abs(percentSinceYesterday))

        } else {
            result += Strings.notChanged
        }

        return result
    }

    private func getCurrencyName(currency: Currency) -> String {
        switch currency {
        case .rub:
            return Strings.ruble
        case .eur:
            return Strings.euro
        case .usd:
            return Strings.dollar
        }
    }

    private func getPercentLabelColor(percent: Int) -> UIColor {
        if percent > 0 {
            return UIColor.init(rgb: 0x7ed321)
        } else if percent < 0 {
            return UIColor.init(rgb: 0xd0021b)
        } else {
            return UIColor.init(rgb: 0x3f4753)
        }
    }

    @objc private func onMenuButtonClick() {
        self.props?.onMenuButtonClick()
    }
}
