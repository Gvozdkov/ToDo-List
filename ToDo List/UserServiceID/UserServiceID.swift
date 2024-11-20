import Foundation

class UserServiceID {
    static let shared = UserServiceID()
    private let userIdKey = "userIdKey"
    
    private init() {
        if getUserId() == nil {
            let newUserId = generateNumericUserId()
            saveUserId(newUserId)
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
}
