//
//  Person.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 12/03/21.
//

import UIKit

protocol SendValueProtocol: class{
    func sendValue(text: String, indentify:String)
}

class Person: UIView {
    
    weak var delegate: SendValueProtocol?
    
    static var maxValue = Int()

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
    
    @objc func setValueFirstPerson(_ button: UIButton){
        guard let nameTf = self.tfValueFirstPerson.accessibilityIdentifier else { return }
        guard let nameButton = button.accessibilityIdentifier, let value = self.tfValueFirstPerson.text else { return }

        
        if(Int(value)! >= Person.maxValue){
            Person.maxValue = Int(value)!
            if(nameTf == nameButton){
                self.tfValueFirstPerson.text = ""
                self.delegate?.sendValue(text: value, indentify: nameButton)
            }
        }
    }

}

extension Person: Observer{
    func update(_ notifyValue: Any) {
        let value = notifyValue as! Int
        self.lbValue.text = String(value)
    }
}
