//
//  ViewController3.swift
//  GoSOPT1stWeekStudy
//
//  Created by 부창현 on 2023/08/08.
//

import UIKit

final class ViewController3: UIViewController {
    
    var name: String?
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "My name is!"
        label.font = .boldSystemFont(ofSize: 20)
        return label// Do any additional setup after loading the view.
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton()
        button.setTitle("go back", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        
        button.addTarget(self,
                         action: #selector(backButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
        dataBind()
    }
    
    func dataBind() {
        nameLabel.text = name
    }
    
}
private extension ViewController3 {
    
    func style() {
        
        view.backgroundColor = .white
    }
    
    func setLayout() {
        
        [nameLabel, backButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        NSLayoutConstraint.activate([nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     nameLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
    
        
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                     backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                     backButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                     backButton.heightAnchor.constraint(equalToConstant: 48)])
    }
    @objc
        func backButtonTapped() {
            
            if self.navigationController == nil {
                self .dismiss(animated: true, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: true)
        }
    }
        
}


