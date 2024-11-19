import Foundation

protocol AddTaskInteractorProtocol {
    func saveTask(task: TaskModel)
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
}
