import UIKit

final class ToDoCell: UITableViewCell {
    static let reuseIdentifier = "ToDoCellReuseIdentifier"
    private var isCompleted: Bool = false
    
    private lazy var taskProgressButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.strokeCustom.cgColor
        button.addTarget(self, action: #selector(taskProgressButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var taskProgressImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        imageView.tintColor = .yellowCustom
        if let image = UIImage(named: "tickOk")?.withRenderingMode(.alwaysTemplate) {
            imageView.image = image
        }
        return imageView
    }()
    
    private lazy var taskTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .whiteCustom
        return label
    }()
    
    private lazy var taskTodoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .whiteCustom
        return label
    }()
    
    private lazy var dateOfCreationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .whiteCustom
        label.alpha = 0.5
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        constraintsCell()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        assertionFailure("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func constraintsCell() {
        contentView.addSubview(taskProgressButton)
        taskProgressButton.addSubview(taskProgressImageView)
        contentView.addSubview(taskTitleLabel)
        contentView.addSubview(taskTodoLabel)
        contentView.addSubview(dateOfCreationLabel)
        
        
        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 108),
            
            taskProgressButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            taskProgressButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            taskProgressButton.widthAnchor.constraint(equalToConstant: 24),
            taskProgressButton.heightAnchor.constraint(equalToConstant: 24),
            
            taskProgressImageView.centerYAnchor.constraint(equalTo: taskProgressButton.centerYAnchor),
            taskProgressImageView.centerXAnchor.constraint(equalTo: taskProgressButton.centerXAnchor),
            taskProgressImageView.widthAnchor.constraint(equalToConstant: 12),
            taskProgressImageView.heightAnchor.constraint(equalToConstant: 9),
            
            taskTitleLabel.leadingAnchor.constraint(equalTo: taskProgressButton.trailingAnchor, constant: 8),
            taskTitleLabel.centerYAnchor.constraint(equalTo: taskProgressButton.centerYAnchor),
            
            taskTodoLabel.topAnchor.constraint(equalTo: taskProgressButton.bottomAnchor, constant: 6),
            taskTodoLabel.leadingAnchor.constraint(equalTo: taskProgressButton.trailingAnchor, constant: 8),
            taskTodoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateOfCreationLabel.topAnchor.constraint(equalTo: taskTodoLabel.bottomAnchor, constant: 6),
            dateOfCreationLabel.leadingAnchor.constraint(equalTo: taskProgressButton.trailingAnchor, constant: 8)
        ])
        
    }
    
    private func updateTaskProgressButtonAppearance() {
        isCompleted.toggle()
        setTaskAppearance(isCompleted: isCompleted)
    }
    
    private func setTaskAppearance(isCompleted: Bool) {
        taskProgressButton.layer.borderColor = isCompleted ? UIColor.yellowCustom.cgColor : UIColor.strokeCustom.cgColor
        taskProgressImageView.isHidden = !isCompleted
        
        let textAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .medium),
            .strikethroughStyle: isCompleted ? NSUnderlineStyle.single.rawValue : 0
        ]
        
        taskTitleLabel.attributedText = NSAttributedString(
            string: taskTitleLabel.text ?? "",
            attributes: textAttributes
        )
        
        taskTitleLabel.alpha = isCompleted ? 0.5 : 1.0
        taskTodoLabel.alpha = isCompleted ? 0.5 : 1.0
    }
    
    @objc private func taskProgressButtonTapped() {
        updateTaskProgressButtonAppearance()
    }
    
    func configureCell(with task: TaskModel) {
        taskTitleLabel.text = task.title
        taskTodoLabel.text = task.todo
        dateOfCreationLabel.text = task.dateOfCreation
        isCompleted = task.completed
        setTaskAppearance(isCompleted: isCompleted)
    }
}
