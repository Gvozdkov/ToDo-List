import UIKit

final class AddTaskVC: UIViewController {
    var router: ToDoRouterProtocol?
    var presenter: AddTaskPresenter?
    
    private lazy var tasksNameTextView: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.maximumNumberOfLines = 1
        textView.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        textView.textColor = .whiteCustom
        textView.backgroundColor = .blackCustom
        textView.keyboardAppearance = .dark
        textView.delegate = self
        return textView
    }()
    
    private lazy var dateOfCreationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .whiteCustom
        label.alpha = 0.5
        label.isHidden = true
        return label
    }()
    
    private lazy var taskDetailsStackView: UIStackView = {
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
        textView.delegate = self
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraintsViewController()
        tasksNameTextView.becomeFirstResponder()
        updateDateLabel()
    }
    
    private func constraintsViewController() {
        view.backgroundColor = .blackCustom
       
        view.addSubview(taskDetailsStackView)
        view.addSubview(taskTextView)
        
        
        NSLayoutConstraint.activate([
            taskDetailsStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            taskDetailsStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskDetailsStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            tasksNameTextView.heightAnchor.constraint(equalToConstant: 45),
            
            taskTextView.topAnchor.constraint(equalTo: taskDetailsStackView.bottomAnchor, constant: 16),
            taskTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            taskTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            taskTextView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    private func updateDateLabel() {
        dateOfCreationLabel.text = presenter?.fetchTaskDate()
    }
}

extension AddTaskVC: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        let updatedText = (currentText as NSString).replacingCharacters(in: range, with: text)
        
        if updatedText.isEmpty {
            dateOfCreationLabel.isHidden = true
        } else {
            dateOfCreationLabel.isHidden = false
        }
        
        if text == "\n" {
            if textView == tasksNameTextView {
                taskTextView.becomeFirstResponder()
            } else if textView == taskTextView {
                textView.resignFirstResponder()
                router?.navigateBack()
            }
            return false
        }
        return true
    }
}
