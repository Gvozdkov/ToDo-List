import Foundation

protocol ToDoListPresenterProtocol {
    func getAllTasks()
    func getSerchTasks() -> [TaskModel]
    func requestTaskSearch(search: String)
    func requesTextCountTasks() -> String
    func requestEditTask()
    func requestShareTask()
    func requestDeleteTask()
    
}

final class ToDoListPresenter: ToDoListPresenterProtocol {
    private let interactor: ToDoListInteractorProtocol
    
    init(interactor: ToDoListInteractor) {
        self.interactor = interactor
    }
    
    func getAllTasks() {
        interactor.fetchAllTasks()
    }
    
    func getSerchTasks() -> [TaskModel] {
        return interactor.fetchSerchTasks()
    }
    
    func requestTaskSearch(search: String) {
        return interactor.searchTask(search: search)
    }
    
    func requesTextCountTasks() -> String {
        return interactor.textCountTasks()
    }
    
    func requestEditTask() {
        interactor.editTask()
    }
    
    func requestShareTask() {
        interactor.shareTask()
    }
    
    func requestDeleteTask() {
        interactor.deleteTask()
    }
}
