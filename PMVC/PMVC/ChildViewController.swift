import UIKit

class ChildViewController: UIViewController {
    var parentViewControler: ParentViewController
    
    let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Present toy", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    init(parentViewController: ParentViewController) {
        self.parentViewControler = parentViewController
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
        
        view.backgroundColor = .brown
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
        
        let viewController = ToyViewController(childViewController: self)
        viewController.modalPresentationStyle = .overFullScreen
        self.present(viewController, animated: true)
    }
}

