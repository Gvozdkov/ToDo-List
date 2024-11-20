protocol TaskServiceProtocol {
    var allTasks: [TaskModel] { get }
    func addTask(task: TaskModel)
    func updateTask(task: TaskModel)
    func deleteTask(task: TaskModel)
}

final class TaskService: TaskServiceProtocol {
    static let shared = TaskService()
    
    private(set) var allTasks: [TaskModel] = [
        TaskModel(
            id: 1,
            title: "Почитать книгу",
            todo: "Составить список необходимых продуктов для ужина. Не забыть проверить, что уже есть в холодильнике.",
            completed: false,
            userId: 1,
            dateOfCreation: "15/11/24"),
        TaskModel(
            id: 2,
            title: "Уборка в квартире",
            todo: "Провести генеральную уборку в квартире",
            completed: true,
            userId: 2,
            dateOfCreation: nil),
    ]
    
    func addTask(task: TaskModel) {
        allTasks.append(task)
    }
    
    func updateTask(task: TaskModel) {
        if let index = allTasks.firstIndex(where: { $0.id == task.id && $0.userId == task.userId }) {
            allTasks[index] = task
        }
    }
    
    func deleteTask(task: TaskModel) {
        allTasks.removeAll { $0.id == task.id && $0.userId == task.userId }
    }
}
