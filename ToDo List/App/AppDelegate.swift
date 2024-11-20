import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        _ = UserServiceID.shared.getUserId()
        
        window = UIWindow()
        
        let todoListVC = ToDoListModuleBuilder.build()
        let navigationController = UINavigationController(rootViewController: todoListVC)
        
        window?.rootViewController = navigationController
        window?.overrideUserInterfaceStyle = .light
        window?.makeKeyAndVisible()
        
        return true
    }
}

