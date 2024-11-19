import UIKit

protocol ToDoRouterProtocol: AnyObject {
    func navigateToAddTask()
}

class ToDoRouter: ToDoRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToAddTask() {
        let addTaskVC = AddTaskModuleBuilder.build()
        viewController?.navigationController?.pushViewController(addTaskVC, animated: true)
    }
}
