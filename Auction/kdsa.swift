//
//  kdsa.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 12/03/21.
//

import Foundation
import UIKit

protocol HomeViewDelegates:class{
    func loginButtonClicked(sender: UIButton)
}

class HomeView: UIView {

    //2. Create a delegate
    weak var delegate: HomeViewDelegates?

    var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.axis = .vertical
        stack.isUserInteractionEnabled = true
        return stack
    }()

    let haveAccount: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.text = "ok"
        label.textAlignment = .center
        return label
    }()

    let signin: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sign in", for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir", size: 14)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(loginClicked(sender:)), for: .touchUpInside)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .red
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        stackView.addArrangedSubview(haveAccount)
        stackView.addArrangedSubview(signin)
        stackView.setCustomSpacing(4.0, after: haveAccount)

        addSubview(stackView)
       
       
        NSLayoutConstraint.activate([
        
//            self.stackView.heightAnchor.constraint(equalToConstant: 300),

            self.stackView.topAnchor.constraint(equalTo: self.topAnchor),
            self.stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),


        ])
        

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   //3. Call your protocol method via delegate
   @objc func loginClicked(sender: UIButton) {
        if let delegate = delegate{
            delegate.loginButtonClicked(sender: sender)
        }
    }

}


