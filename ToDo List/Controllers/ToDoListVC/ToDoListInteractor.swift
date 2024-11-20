import Foundation
protocol ToDoListInteractorProtocol {
    func fetchAllTasks()
    func fetchSerchTasks() -> [TaskModel]
    func searchTask(search: String)
    func textCountTasks() -> String
    func updateTaskStatus(task: TaskModel)
    func editTask()
    func shareTask()
    func deleteTask()
}

final class ToDoListInteractor: ToDoListInteractorProtocol {
    private let taskService: TaskServiceProtocol
    
    init(taskService: TaskServiceProtocol) {
        self.taskService = taskService
   
    }
    private var serchTasks = [TaskModel]()
    
    func fetchAllTasks() {
        serchTasks = taskService.allTasks
    }
    
    func fetchSerchTasks() -> [TaskModel] {
        return serchTasks
    }
    
    func searchTask(search: String) {
        serchTasks.removeAll()
        
        if search.isEmpty {
            serchTasks = taskService.allTasks
            return
        }

        for searchTask in taskService.allTasks {
            if let title = searchTask.title?.lowercased(), title.contains(search.lowercased()) ||
               searchTask.todo.lowercased().contains(search.lowercased()) {
                
                if !serchTasks.contains(where: { $0.id == searchTask.id && $0.userId == searchTask.userId && $0.dateOfCreation == searchTask.dateOfCreation}) {
                    serchTasks.append(searchTask)
                }
            }
        }
    }
    
    func textCountTasks() -> String {
        let incompleteTasksCount = taskService.allTasks.filter { !$0.completed }.count
        return String.localizedStringWithFormat(NSLocalizedString("tasksСount", comment: ""), incompleteTasksCount)
    }
    
    func updateTaskStatus(task: TaskModel) {
        taskService.updateTask(task: task)
    }
    
    func editTask() {
        print("editTask")
    }
    
    func shareTask() {
        print("shareTask")
    }
    
    func deleteTask() {
        print("deleteTask")
    }
}
