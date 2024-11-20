import UIKit

class ToDoListModuleBuilder {
    static func build() -> UIViewController {
        let todoListVC = ToDoListVC()
        let taskService = TaskService.shared
        let interactor = ToDoListInteractor(taskService: taskService)
        let presenter = ToDoListPresenter(interactor: interactor)
        let router = ToDoRouter()
        
        router.viewController = todoListVC
        todoListVC.router = router
        todoListVC.presenter = presenter
        
        return todoListVC
    }
}
