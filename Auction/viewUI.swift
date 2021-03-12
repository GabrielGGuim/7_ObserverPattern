//
//  viewUI.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 10/03/21.
//

import UIKit

class viewUI: UIView {
 
    
    let tfValueFirstPerson: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter value"
        tf.font = UIFont.systemFont(ofSize: 25)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.keyboardType = UIKeyboardType.numberPad
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(setValueFirstPerson), for: .editingChanged)
        return tf
    }()
    
    let tfValueSecondPerson: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter value"
        tf.font = UIFont.systemFont(ofSize: 25)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.keyboardType = UIKeyboardType.numberPad
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(setValueSecondPerson), for: .editingChanged)
        return tf
    }()
    
    let tfValueThirdPerson: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Enter value"
        tf.font = UIFont.systemFont(ofSize: 25)
        tf.borderStyle = UITextField.BorderStyle.roundedRect
        tf.keyboardType = UIKeyboardType.numberPad
        tf.returnKeyType = UIReturnKeyType.done
        tf.clearButtonMode = UITextField.ViewMode.whileEditing
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.addTarget(self, action: #selector(setValueThirdPerson), for: .editingChanged)
        return tf
    }()
    
    
    let valueContainer: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.axis = .horizontal
        view.spacing = 5
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.valueContainer.addArrangedSubview(tfValueFirstPerson)
        self.valueContainer.addArrangedSubview(tfValueSecondPerson)
        self.valueContainer.addArrangedSubview(tfValueThirdPerson)

        self.addSubview(self.valueContainer)
        self.backgroundColor = .red
        
        NSLayoutConstraint.activate([
        
            self.valueContainer.centerYAnchor.constraint(equalTo: layoutMarginsGuide.centerYAnchor),
            self.valueContainer.centerXAnchor.constraint(equalTo: layoutMarginsGuide.centerXAnchor),
            self.valueContainer.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.valueContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor),

            
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @objc func setValueFirstPerson(_ textField: UITextField){
        
    }
    
    @objc func setValueSecondPerson(_ textField: UITextField){
        
    }
    
    @objc func setValueThirdPerson(_ textField: UITextField){
        
    }
    
}
