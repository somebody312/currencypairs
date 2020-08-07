import Foundation
import Alamofire

class DataFetcher : DataFetcherProtocol {
    private let urlBuilder: ApiUrlBuilderProtocol

    init (urlBuilder: ApiUrlBuilderProtocol) {
        self.urlBuilder = urlBuilder
    }

    func getCurrencyPair(
        baseCurrency: Currency,
        secondCurrency: Currency,
        date: Date,
        onSuccess: @escaping (ApiDataModel) -> Void,
        onFail: @escaping (String?) -> Void
    ) {
        let url = self.urlBuilder.getRatesUrl(
            baseCurrency: baseCurrency.rawValue,
            secondCurrency: secondCurrency.rawValue,
            date: date
        )

        AF.request(url)
          .responseDecodable(of: ApiDataModel.self) { response in
            if let error = response.error {
                print(error)
                onFail(error.errorDescription)
            } else if response.value != nil {
                onSuccess(response.value!)
            } else {
                onFail(nil)
            }
        }
    }
}
