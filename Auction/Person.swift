//
//  Person.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 12/03/21.
//

import UIKit

class Person: UIView {
    
    let imPerson: UIImageView = {
        let iv = UIImageView()
    
        iv.image = UIImage.init(systemName: "person")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    let tfValueFirstPerson: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter value"
        tf.font = UIFont.systemFont(ofSize: 25)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.keyboardType = UIKeyboardType.numberPad
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing

        tf.addTarget(self, action: #selector(editValueFirstPerson), for: .editingChanged)
        tf.translatesAutoresizingMaskIntoConstraints = false
        
        return tf
    }()
    
    var btnSendValue: UIButton = {
        let btn = UIButton()
        btn.setTitle("Send", for: .normal)
        btn.backgroundColor = .green
        btn.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(setValueFirstPerson), for: .touchUpInside)

        return btn
    }()
    
    let lbValue: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .gray
        lb.font = .systemFont(ofSize: 25, weight: .bold)
        lb.textAlignment = .center
        lb.text = "Value"
        lb.translatesAutoresizingMaskIntoConstraints = false

        return lb
    }()
    
    let container: UIStackView = {
        let stack = UIStackView(frame: .zero)
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 8

        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.translatesAutoresizingMaskIntoConstraints = false

        addPerson()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPerson(){
        
        self.container.addArrangedSubview(imPerson)

        self.container.addArrangedSubview(tfValueFirstPerson)
        self.container.addArrangedSubview(btnSendValue)
        self.container.addArrangedSubview(lbValue)
        
        self.addSubview(container)
    }
        
    func addConstraints(){
        NSLayoutConstraint.activate([
            
            self.container.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            self.container.topAnchor.constraint(equalTo: self.topAnchor),
            self.container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
    }
    
    @objc func editValueFirstPerson(_ textField: UITextField){
        guard let name = textField.accessibilityIdentifier else { return }

        print(name)
    }
    
    @objc func setValueFirstPerson(_ button: UIButton){
        guard let name = button.accessibilityIdentifier else { return }
        print(name)

        
    }

}
