import UIKit

final class ToDoListVC: UIViewController {
    var router: ToDoListRouterProtocol?
    var presenter: ToDoListPresenter?
    
    private lazy var tasksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        label.textColor = .whiteCustom
        label.text = "Задачи"
        return label
    }()
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self

        let textField = searchBar.searchTextField
        textField.textColor = .whiteCustom
        textField.attributedPlaceholder = NSAttributedString(
            string: "Search",
            attributes: [.foregroundColor: UIColor.whiteCustom.withAlphaComponent(0.5)]
        )
        
        textField.backgroundColor = UIColor.grayCustom

        if let leftView = textField.leftView as? UIImageView {
            leftView.tintColor = .whiteCustom.withAlphaComponent(0.5)
        }

        return searchBar
    }()
    
    private lazy var tasksTable: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .blackCustom
        tableView.separatorColor = UIColor.whiteCustom
        tableView.separatorInset = .zero
        tableView.register(ToDoCell.self, forCellReuseIdentifier: ToDoCell.reuseIdentifier)
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    private lazy var tabBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .grayCustom
        return view
    }()
    
    private lazy var numberOfTasksLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .whiteCustom
        label.text = "7 задач"
        return label
    }()
    
    private lazy var addTaskButton: UIButton = {
        let image = UIImage(named: "createTask")
        
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setImage(image, for: .normal)
        button.addTarget(self, action: #selector(addTaskButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var tapGesture: UITapGestureRecognizer = {
        let tapGesture = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(hideKeyboard))
        return tapGesture
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsViewController()
        setupBackButton()
        presenter?.getAllTasks()
        tasksTable.reloadData()
    }
    
    private func constraintsViewController() {
        view.backgroundColor = .blackCustom
        
        view.addGestureRecognizer(tapGesture)
        
        view.addSubview(tasksLabel)
        view.addSubview(searchBar)
        view.addSubview(tasksTable)
        view.addSubview(tabBarView)
        tabBarView.addSubview(numberOfTasksLabel)
        tabBarView.addSubview(addTaskButton)
        
        NSLayoutConstraint.activate([
            
            tasksLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tasksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            searchBar.topAnchor.constraint(equalTo: tasksLabel.bottomAnchor, constant: 10),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            searchBar.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            searchBar.heightAnchor.constraint(equalToConstant: 36),
            
            tasksTable.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            tasksTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tasksTable.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tasksTable.bottomAnchor.constraint(equalTo: tabBarView.topAnchor),
            
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 73),
            
            numberOfTasksLabel.topAnchor.constraint(equalTo: tabBarView.topAnchor, constant: 20.5),
            numberOfTasksLabel.centerXAnchor.constraint(equalTo: tabBarView.centerXAnchor),
            
            addTaskButton.centerYAnchor.constraint(equalTo: numberOfTasksLabel.centerYAnchor),
            addTaskButton.trailingAnchor.constraint(equalTo: tabBarView.trailingAnchor, constant: -10),
            addTaskButton.heightAnchor.constraint(equalToConstant: 68),
            addTaskButton.widthAnchor.constraint(equalToConstant: 44),
        ])
    }
    
    @objc private func addTaskButtonTapped() {
        router?.navigateToAddTask()
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}

extension ToDoListVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Пользователь ввёл: \(searchText)")
        presenter?.requestTaskSearch(search: searchText)
        tasksTable.reloadData()
    }
}

extension ToDoListVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getSerchTasks().count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: ToDoCell.reuseIdentifier, for: indexPath) as? ToDoCell {
            if let task = presenter?.getSerchTasks()[indexPath.row] {
                cell.configureCell(with: task)
            }
            return cell
        } else {
            assertionFailure("Error - ScheduleCastomCell")
            return UITableViewCell()
        }
    }
}

extension ToDoListVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            let editImage = UIImage(named: "edit")?.withTintColor(.blackCustom)
            let shareImage = UIImage(named: "export")?.withTintColor(.blackCustom)
            let deleteImage = UIImage(named: "trash")?.withTintColor(.redCustom)
            
            let editAction = UIAction(title: "Редактировать", image: editImage) { _ in
                self.presenter?.requestEditTask()
            }
            
            let shareAction = UIAction(title: "Поделиться", image: shareImage) { _ in
                self.presenter?.requestShareTask()
            }
            
            let deleteAction = UIAction(title: "Удалить", image: deleteImage, attributes: .destructive) { _ in
                self.presenter?.requestDeleteTask()
            }
            
            return UIMenu(title: "", children: [editAction, shareAction, deleteAction])
        }
    }
}
