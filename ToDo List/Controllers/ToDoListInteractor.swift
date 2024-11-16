import Foundation

protocol ToDoListInteractorProtocol {
    func fetchTasks() -> [TaskModel]
}

final class ToDoListInteractor: ToDoListInteractorProtocol {
    private var tasks: [TaskModel] = [
        TaskModel(id: 1, title: "Почитать книгу", todo: "Составить список необходимых продуктов для ужина. Не забыть проверить, что уже есть в холодильнике.", completed: false, userId: 1, dateOfCreation: "15/11/24"),
        TaskModel(id: 2, title: "Уборка в квартире", todo: "Провести генеральную уборку в квартире", completed: true, userId: 2, dateOfCreation: nil),
    ]
    
    func fetchTasks() -> [TaskModel] {
        return tasks
    }
}
