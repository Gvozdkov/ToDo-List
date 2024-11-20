import Foundation

protocol AddTaskPresenterProtocol {
    func fetchSSaveTask(task: TaskModel)
    func fetchTaskDate() -> String
}

final class AddTaskPresenter: AddTaskPresenterProtocol {
    private let interactor: AddTaskInteractor
    
    init(interactor: AddTaskInteractor) {
        self.interactor = interactor
    }
    
    func fetchSSaveTask(task: TaskModel) {
        interactor.saveTask(task: task)
    }
    
    func fetchTaskDate() -> String {
        return interactor.getTaskDate()
    }
}
