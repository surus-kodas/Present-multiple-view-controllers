import UIKit

class ParentViewController: UIViewController {
    var homeViewControler: HomeViewController
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present child", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    init(homeViewControler: HomeViewController) {
        self.homeViewControler = homeViewControler
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("deinit: \(self)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .red
        setupViews()
    }

    func setupViews() {
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print("Button tapped in \(self)")
        let viewController = ChildViewController(parentViewController: self)
        viewController.modalPresentationStyle
        self.present(viewController, animated: true)
    }
}

