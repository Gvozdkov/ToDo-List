import Foundation

protocol TaskToggleable {
    func toggledCompleted() -> TaskModel
}

struct TaskModel {
    let id: Int
    let title: String?
    let todo: String
    let completed: Bool
    let userId: Int
    let dateOfCreation: String?
}

extension TaskModel: TaskToggleable {
    func toggledCompleted() -> TaskModel {
        return TaskModel (
            id: id,
            title: title,
            todo: todo,
            completed: !completed,
            userId: userId,
            dateOfCreation: dateOfCreation)
    }
}
