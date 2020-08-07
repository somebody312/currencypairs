import Foundation

class Interaction : InteractionProtocol {

    private var fetcher: DataFetcherProtocol

    private var controller: ViewController?
    private var view: MainView?
    private var state: State

    private let dispatchGroup = DispatchGroup()

    required init(fetcher: DataFetcherProtocol) {
        self.fetcher = fetcher
        self.state = State(baseCurrency: .usd, secondCurrency: .rub)
    }

    func setup(controller: ViewController, view: MainView) {
        self.controller = controller
        self.view = view

        updateData()
    }

    private func updateData() {
        obtainRates(date: Date()) { model in
            self.state.todayRates = model
        }

        obtainRates(date: Date().yesterday()) { model in
            self.state.yesterdayRates = model
        }

        dispatchGroup.notify(queue: DispatchQueue.main) {
            self.applyPropsToView()
        }
    }

    private func obtainRates(date: Date, onSuccess: @escaping (ApiDataModel) -> Void) {
        dispatchGroup.enter()

        fetcher.getCurrencyPair(
            baseCurrency: state.baseCurrency,
            secondCurrency: state.secondCurrency,
            date: date,
            onSuccess: { model in
                onSuccess(model)
                self.dispatchGroup.leave()
            },
            onFail: { error in
                self.controller?.showToast(message: Strings.error)
                self.dispatchGroup.leave()
            }
        )
    }

    private func applyPropsToView() {
        view?.applyProps(props: ViewProps(
            baseCurrency: state.baseCurrency,
            secondCurrency: state.secondCurrency,
            rate: RatesHelper.getRate(
                data: state.todayRates,
                secondCurrency: state.secondCurrency
            ),
            percentSinceYesterday: RatesHelper.getPercentSinceYesterday(
                todayData: state.todayRates,
                yesterdayData: state.yesterdayRates,
                secondCurrency: state.secondCurrency
            ),
            refreshDate: Date(),
            onMenuButtonClick: showMenu
        ))
    }

    private func showMenu() {
        guard controller != nil, view != nil else {
            return
        }

        let menuSheet = ActionSheetBuilder.buildCurrenciesSheet(
            baseCurrency: state.baseCurrency,
            secondCurrency: state.secondCurrency) { currencyPair in
                self.state = State(baseCurrency: currencyPair.baseCurrency, secondCurrency: currencyPair.secondCurrency)
                self.updateData()
            }

        menuSheet.present(in: controller!, from: view!)
    }
}
