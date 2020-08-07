import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    public static var current: AppDelegate?

    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        AppDelegate.current = self
        ActionSheetBuilder.setSheetAppearance()

        ObjectFactory.initialize(with: DIContainerBuilder.build())

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()

        return true
    }
}
