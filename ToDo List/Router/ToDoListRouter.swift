import UIKit

protocol ToDoListRouterProtocol: AnyObject {
    func navigateToAddTask()
}

class ToDoListRouter: ToDoListRouterProtocol {
    weak var viewController: UIViewController?

    func navigateToAddTask() {
        let addTaskVC = AddTaskVC()
        viewController?.navigationController?.pushViewController(addTaskVC, animated: true)
    }
}
