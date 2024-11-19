import UIKit

extension UIViewController {
    func setupBackButton() {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        navigationItem.backBarButtonItem = backButton
        navigationController?.navigationBar.tintColor = .yellowCustom
        navigationController?.navigationBar.barTintColor = .blackCustom
        navigationController?.navigationBar.isTranslucent = false
        
    }
}
