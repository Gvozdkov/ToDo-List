import UIKit

final class ToDoCell: UITableViewCell {
    static let reuseIdentifier = "ToDoCellReuseIdentifier"
    
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
        label.text = "Почитать книгу"
        return label
    }()
    
    private lazy var taskDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.numberOfLines = 2
        label.textColor = .whiteCustom
        label.text = "Составить список необходимых продуктов для ужина. Не забыть проверить, что уже есть в холодильнике."
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .whiteCustom
        label.alpha = 0.5
        label.text = "09/10/24"
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
        contentView.addSubview(taskDescriptionLabel)
        contentView.addSubview(dateLabel)
        
        
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
            
            taskDescriptionLabel.topAnchor.constraint(equalTo: taskProgressButton.bottomAnchor, constant: 6),
            taskDescriptionLabel.leadingAnchor.constraint(equalTo: taskProgressButton.trailingAnchor, constant: 8),
            taskDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            dateLabel.topAnchor.constraint(equalTo: taskDescriptionLabel.bottomAnchor, constant: 6),
            dateLabel.leadingAnchor.constraint(equalTo: taskProgressButton.trailingAnchor, constant: 8)
        ])
        
    }
    
    private func updateTaskProgressButtonAppearance() {
        if taskProgressButton.layer.borderColor == UIColor.yellowCustom.cgColor {
            taskProgressButton.layer.borderColor = UIColor.strokeCustom.cgColor
            taskProgressImageView.isHidden = true
            
            let nonStrikethroughText = NSAttributedString(
                string: taskTitleLabel.text ?? "",
                attributes: [
                    .font: UIFont.systemFont(ofSize: 16, weight: .medium)
                ]
            )
            taskTitleLabel.attributedText = nonStrikethroughText
            taskTitleLabel.alpha = 1
            taskDescriptionLabel.alpha = 1
        } else {
            taskProgressButton.layer.borderColor = UIColor.yellowCustom.cgColor
            taskProgressImageView.isHidden = false
            
            let strikethroughText = NSAttributedString(
                string: taskTitleLabel.text ?? "",
                attributes: [
                    .strikethroughStyle: NSUnderlineStyle.single.rawValue,
                    .font: UIFont.systemFont(ofSize: 16, weight: .medium)
                ]
            )
            taskTitleLabel.attributedText = strikethroughText
            taskTitleLabel.alpha = 0.5
            taskDescriptionLabel.alpha = 0.5
        }
    }
    
    @objc private func taskProgressButtonTapped() {
        updateTaskProgressButtonAppearance()
    }
    
    func configureCell(with task: TaskModel) {
        
    }
}
