import Foundation

protocol ToDoListPresenterProtocol {
    func getTasks() -> [TaskModel]
}

final class ToDoListPresenter: ToDoListPresenterProtocol {
    private let interactor: ToDoListInteractorProtocol
    
    init(interactor: ToDoListInteractor) {
        self.interactor = interactor
    }
    
    func getTasks() -> [TaskModel] {
        return interactor.fetchTasks()
    }
}
