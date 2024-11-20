import Foundation

class UserServiceID {
    static let shared = UserServiceID()
    
    private let userIdKey = "userIdKey"
    private let taskIdKey = "taskIdKey"
    
    private init() {
        if getUserId() == nil {
            let newUserId = generateNumericUserId()
            saveUserId(newUserId)
        }
        
        if UserDefaults.standard.object(forKey: taskIdKey) == nil {
            UserDefaults.standard.set(0, forKey: taskIdKey)
        }
    }
    
    func getUserId() -> Int? {
        if let userId = UserDefaults.standard.object(forKey: userIdKey) as? Int {
            return userId
        } else {
            return nil
        }
    }
    
    private func saveUserId(_ id: Int) {
        UserDefaults.standard.set(id, forKey: userIdKey)
        UserDefaults.standard.synchronize()
    }
    
    private func generateNumericUserId() -> Int {
        let uuid = UUID().uuidString
        let numericString = uuid.filter { $0.isNumber }
        
        let truncatedNumericString = String(numericString.prefix(9))
        
        return Int(truncatedNumericString) ?? 0
    }
    
    func getNextTaskId() -> Int {
        let currentTaskId = UserDefaults.standard.integer(forKey: taskIdKey)
        let nextTaskId = currentTaskId + 1
        
        UserDefaults.standard.set(nextTaskId, forKey: taskIdKey)
        UserDefaults.standard.synchronize()
        
        return nextTaskId
    }
}
