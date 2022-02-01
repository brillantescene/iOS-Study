//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport


class RoundedView: UIView {
    
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        self.backgroundColor = .systemPink
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()

class MyViewController: UIViewController {
    let child = RoundedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(child)

        NSLayoutConstraint.activate ([
            self.child.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.child.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}


//PlaygroundPage.current.liveView = MyViewController()
PlaygroundPage.current.liveView = RoundedView()
