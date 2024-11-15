import UIKit

final class ToDoListVC: UIViewController {
    
    var router: ToDoListRouterProtocol?
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 15
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var backButton: UIBarButtonItem {
        let backButton = UIBarButtonItem()
        backButton.title = "Назад"
        navigationItem.backBarButtonItem = backButton
        return backButton
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        settingsViewController()

    }

    private func settingsViewController() {
        view.backgroundColor = .black
        
        view.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            addTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTaskButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            addTaskButton.heightAnchor.constraint(equalToConstant: 100),
            addTaskButton.widthAnchor.constraint(equalToConstant: 100),
        ])
    }
    
    @objc private func addTaskButtonTapped() {
        router?.navigateToAddTask()
    }
}
