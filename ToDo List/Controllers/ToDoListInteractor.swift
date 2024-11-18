import Foundation

protocol ToDoListInteractorProtocol {
    func fetchAllTasks()
    func fetchSerchTasks() -> [TaskModel]
    func searchTask(search: String)
    func textCountTasks() -> String
    func editTask()
    func shareTask()
    func deleteTask()
}

final class ToDoListInteractor: ToDoListInteractorProtocol {
    private var allTasks: [TaskModel] = [
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
    
    private var serchTasks = [TaskModel]()
    
    func fetchAllTasks() {
        serchTasks = allTasks
    }
    
    func fetchSerchTasks() -> [TaskModel] {
        return serchTasks
    }
    
    func searchTask(search: String) {
        serchTasks.removeAll()
        
        if search.isEmpty {
            serchTasks = allTasks
            return
        }

        for searchTask in allTasks {
            if let title = searchTask.title?.lowercased(), title.contains(search.lowercased()) ||
               searchTask.todo.lowercased().contains(search.lowercased()) {
                
                if !serchTasks.contains(where: { $0.id == searchTask.id && $0.userId == searchTask.userId && $0.dateOfCreation == searchTask.dateOfCreation}) {
                    serchTasks.append(searchTask)
                }
            }
        }
    }
    
    func textCountTasks() -> String {
        let tasksCount = allTasks.filter { !$0.completed }.count
        return String.localizedStringWithFormat(NSLocalizedString("tasksСount", comment: ""), tasksCount)
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
