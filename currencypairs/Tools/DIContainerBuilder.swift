import Foundation
import Swinject

class DIContainerBuilder {
    public static func build() -> Container {
        let container = Container()

        container.register(ApiUrlBuilderProtocol.self, factory: { _ -> ApiUrlBuilderProtocol in
            return ApiUrlBuilder()
        })

        container.register(DataFetcherProtocol.self) { (resolver : Resolver) -> DataFetcherProtocol in
            return DataFetcher(
                urlBuilder: resolver.resolve(ApiUrlBuilderProtocol.self)!
            )
        }

        container.register(MainViewProtocol.self) { (resolver: Resolver) -> MainViewProtocol in
            return MainView()
        }

        container.register(InteractionProtocol.self) { (resolver : Resolver) -> InteractionProtocol in
            return Interaction(
                fetcher: resolver.resolve(DataFetcherProtocol.self)!
            )
        }

        return container
    }
}
