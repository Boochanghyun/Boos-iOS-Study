//
//  ViewController.swift
//  32th-Sopt-First-Seminar
//
//  Created by BOO on 2023/08/07.
//

import UIKit/*UIKit를 쓰겠다는 것*/

final class ViewController: UIViewController {
    
    private let nameLabel: UILabel = {/*위에서 UIKit를 쓰겠다고 했기 때문에 UIKit안에 있는 UILabel을 쓸 수 있는 것*/
        let label = UILabel()
        label.text = "부창현은 짱이다!"
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setLayout()
    }
}

private extension ViewController {
    func setStyle() {
        view.backgroundColor = .white
    }
    func setLayout() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50)])
    }
}
