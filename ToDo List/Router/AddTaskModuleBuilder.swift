import UIKit

class AddTaskModuleBuilder {
    static func build() -> UIViewController {
        let taskService = TaskService.shared
        let addTaskInteractor = AddTaskInteractor(taskService: taskService)
        let addTaskPresenter = AddTaskPresenter(interactor: addTaskInteractor)
        let addTaskVC = AddTaskVC()
        addTaskVC.presenter = addTaskPresenter
        
        return addTaskVC
    }
}
