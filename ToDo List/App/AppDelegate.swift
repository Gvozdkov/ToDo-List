import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
    
        let todoListVC = ToDoListVC()
        let interactor = ToDoListInteractor()
        let presenter = ToDoListPresenter(interactor: interactor)
        let router = ToDoListRouter()
        
        router.viewController = todoListVC
        todoListVC.router = router
        todoListVC.presenter = presenter
        
        let navigationController = UINavigationController(rootViewController: todoListVC)
        
        window?.rootViewController = navigationController
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        
        return true
    }
}

