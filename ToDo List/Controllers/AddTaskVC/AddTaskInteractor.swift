import Foundation

protocol AddTaskInteractorProtocol {
    func saveTask(task: TaskModel)
    func getTaskDate() -> String
}

final class AddTaskInteractor: AddTaskInteractorProtocol {
    private let taskService: TaskServiceProtocol
    
    init(taskService: TaskServiceProtocol) {
        self.taskService = taskService
    }
    
    func saveTask(task: TaskModel) {
        taskService.addTask(task: task)
        print("AddTaskInteractor \(task)")
    }
    
    func getTaskDate() -> String {
        let dateCurrent = Date.current()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yy"
        let date = dateFormatter.string(from: dateCurrent)
        return date
    }
}

