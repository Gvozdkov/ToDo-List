import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow()
    
        let todoListVC = ToDoListVC()
        let router = ToDoListRouter()
        router.viewController = todoListVC
        todoListVC.router = router
        
        let navigationController = UINavigationController(rootViewController: todoListVC)
        navigationController.navigationBar.tintColor = .white
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }
}

