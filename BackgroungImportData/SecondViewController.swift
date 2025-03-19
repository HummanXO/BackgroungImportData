import UIKit

class SecondViewController: UIViewController {
    
    let data: [ProductEntity]
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 36)
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Loading..."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    init(data: [ProductEntity]) {
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(label)
        if data != [] {
            label.text = "Downloaded \(data.count) objects"
        }
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
