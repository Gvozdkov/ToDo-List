import Foundation

protocol AddTaskPresenterProtocol {
    func fetchSSaveTask(task: TaskModel)
}

final class AddTaskPresenter: AddTaskPresenterProtocol {
    private let interactor: AddTaskInteractor
    
    init(interactor: AddTaskInteractor) {
        self.interactor = interactor
    }
    
    func fetchSSaveTask(task: TaskModel) {
        interactor.saveTask(task: task)
        print("AddTaskPresenter \(task)")
    }
}
