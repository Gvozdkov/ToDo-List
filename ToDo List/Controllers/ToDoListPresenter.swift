import Foundation

protocol ToDoListPresenterProtocol {
    func getTasks() -> [TaskModel]
    func editTask()
    func shareTask()
    func deleteTask()
}

final class ToDoListPresenter: ToDoListPresenterProtocol {
    private let interactor: ToDoListInteractorProtocol
    
    init(interactor: ToDoListInteractor) {
        self.interactor = interactor
    }
    
    func getTasks() -> [TaskModel] {
        return interactor.fetchTasks()
    }
    
    func editTask() {
        interactor.editTask()
    }
    
    func shareTask() {
        interactor.shareTask()
    }
    
    
    func deleteTask() {
        interactor.deleteTask()
    }
}
