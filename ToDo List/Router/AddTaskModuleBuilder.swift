import UIKit

class AddTaskModuleBuilder {
    static func build() -> UIViewController {
        let addTaskVC = AddTaskVC()
        let taskService = TaskService.shared
        let interactor = AddTaskInteractor(taskService: taskService)
        let presenter = AddTaskPresenter(interactor: interactor)
        let router = ToDoRouter()
        
        router.viewController = addTaskVC
        addTaskVC.router = router
        addTaskVC.presenter = presenter
        
        return addTaskVC
    }
}
