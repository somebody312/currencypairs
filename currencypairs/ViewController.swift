import UIKit


class ViewController: UIViewController {
    var customView = MainView()
    var interaction = ObjectFactory.get(type: InteractionProtocol.self)

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.setParentView(view: view)
        interaction?.setup(controller: self, view: customView)
    }
}
