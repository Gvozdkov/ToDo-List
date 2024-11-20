import Foundation

protocol AddTaskInteractorProtocol {
    func createNewTask(title: String, todo: String) -> TaskModel
    func saveTask(task: TaskModel)
    func getTaskDate() -> String
}

final class AddTaskInteractor: AddTaskInteractorProtocol {
    private let taskService: TaskServiceProtocol
    let userServiceID: UserServiceID
    
    init(taskService: TaskServiceProtocol, userServiceID: UserServiceID = UserServiceID.shared) {
        self.taskService = taskService
        self.userServiceID = userServiceID
    }
    
    func createNewTask(title: String, todo: String) -> TaskModel {
        let new = TaskModel(
            id: userServiceID.getNextTaskId(),
            title: title,
            todo: todo,
            completed: false,
            userId: userServiceID.getUserId() ?? 0,
            dateOfCreation: getTaskDate()
        )
        print(new)
        return new
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

