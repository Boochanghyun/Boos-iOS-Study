//
//  ViewController2.swift
//  GoSOPT1stWeekStudy
//
//  Created by 부창현 on 2023/08/08.
//

import UIKit

final class Boos2ndViewController: UIViewController {//여기가 이름 지정하는 곳 같음!
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "이름이 무엇인가요!?"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .blue
        label.textAlignment = .center
        return label
    }()
    
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해 주세요"
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        return textField
    }()
    
    private lazy var presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("present!", for: .normal)
        button.backgroundColor = .yellow
        button.setTitleColor(.blue, for: .normal)
        
        button.addTarget(self,
                         action: #selector(presentButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("push", for: .normal)
        button.backgroundColor = .yellow//버튼의 배경색을 blue로 한다
        button.setTitleColor(.blue, for: .normal)
        
        button.addTarget(self,
                         action: #selector(pushButtonTapped),
                         for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        style()
        setLayout()
    }
}//여기에}이거 안붙여서 오류난 거였음
    
private extension Boos2ndViewController {
        
        
        
        //extension은 프로퍼티를 생성하지 못하고, 나중가면 같은 역할 별로 코드를 놔두는게 협업에 좋은데 같은 역할끼리 묶는 용도로 익스텐션을 뺴서
        
        func style() {
            
            view.backgroundColor = .white
        }
        
        func setLayout() {
            
            [nameLabel, nameTextField,
             presentButton, pushButton].forEach {
                $0.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview($0)
            }
            
            NSLayoutConstraint.activate([nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
                                         nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                         nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)])
            
            NSLayoutConstraint.activate([nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
                                         nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                         nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                         nameTextField.heightAnchor.constraint(equalToConstant: 48)])
            
            NSLayoutConstraint.activate([presentButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
                                         presentButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                         presentButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                         presentButton.heightAnchor.constraint(equalToConstant: 48)])
            
            NSLayoutConstraint.activate([pushButton.topAnchor.constraint(equalTo: presentButton.bottomAnchor, constant: 20),
                                         pushButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
                                         pushButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
                                         pushButton.heightAnchor.constraint(equalToConstant: 48)])
        }
        func presentToSecondViewController() {
        
            let SecondViewController = ViewController3()
            SecondViewController.modalPresentationStyle = .fullScreen
            self.present(SecondViewController, animated: true)
        }
    
        func pushToSecondViewController() {
            
            guard let name = nameTextField.text else { return }
            let secondViewController = ViewController3()
            secondViewController.name = name
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    
        @objc
        func presentButtonTapped() {
        
            presentToSecondViewController()
        }
    
        @objc
        func pushButtonTapped() {
            
            pushToSecondViewController()
        }
    
}
    
    

