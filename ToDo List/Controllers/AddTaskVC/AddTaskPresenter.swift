import Foundation

protocol AddTaskPresenterProtocol {
    func fetchСreateNewTask(title: String, todo: String) -> TaskModel
    func fetchSaveTask(task: TaskModel)
    func fetchTaskDate() -> String
}

final class AddTaskPresenter: AddTaskPresenterProtocol {
    private let interactor: AddTaskInteractor
    
    init(interactor: AddTaskInteractor) {
        self.interactor = interactor
    }

    func fetchСreateNewTask(title: String, todo: String) -> TaskModel {
        return interactor.createNewTask(title: title, todo: todo)
    }
    
    func fetchSaveTask(task: TaskModel) {
        interactor.saveTask(task: task)
    }
    
    func fetchTaskDate() -> String {
        return interactor.getTaskDate()
    }
}
