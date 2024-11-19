import UIKit

final class AddTaskVC: UIViewController {    
    private lazy var tasksNameTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.maximumNumberOfLines = 1
        textView.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        textView.textColor = .whiteCustom
        textView.backgroundColor = .blackCustom
        textView.keyboardAppearance = .dark
        return textView
    }()
    
    private lazy var dateOfCreationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .whiteCustom
        label.alpha = 0.5
        return label
    }()
    
    private lazy var weekdayStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tasksNameTextView, dateOfCreationLabel])
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()
    
    private lazy var taskTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineFragmentPadding = 0
        textView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textView.textColor = .whiteCustom
        textView.backgroundColor = .blackCustom
        textView.keyboardAppearance = .dark
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsViewController()
        tasksNameTextView.becomeFirstResponder()
    }
    
    private func constraintsViewController() {
        view.backgroundColor = .blackCustom
       
        view.addSubview(weekdayStack)
        view.addSubview(taskTextView)
        
        
        NSLayoutConstraint.activate([
            weekdayStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            weekdayStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            weekdayStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tasksNameTextView.heightAnchor.constraint(equalToConstant: 45),
            
            taskTextView.topAnchor.constraint(equalTo: weekdayStack.bottomAnchor, constant: 16),
            taskTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            taskTextView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
