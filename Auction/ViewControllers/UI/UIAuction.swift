
import UIKit

class UIAuction: UIView {
    

    let personOne: Person = {
        let person = Person()
        person.btnSendValue.accessibilityIdentifier = "person1"
        person.tfValueFirstPerson.accessibilityIdentifier = "person1"
        person.lbName.text = "person 1"

        return person
    }()
        
    let personTwo: Person = {
        let person = Person()
        person.btnSendValue.accessibilityIdentifier = "person2"
        person.tfValueFirstPerson.accessibilityIdentifier = "person2"
        person.lbName.text = "person 2"

        return person
    }()
    
    let personThree: Person = {
        let person = Person()
        person.btnSendValue.accessibilityIdentifier = "person3"
        person.tfValueFirstPerson.accessibilityIdentifier = "person3"
        person.lbName.text = "person 3"

        return person
    }()

    let auctioneer = Auctioneer()
    
    let lbwinner: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .lightGray
        lb.font = .systemFont(ofSize: 25, weight: .bold)
        lb.textAlignment = .center
        lb.text = "Winner"
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()

    
    var container: UIStackView = {
        let container = UIStackView(frame: .zero)
        container.axis = .horizontal
        container.distribution = .fillEqually
        container.spacing = 5

        container.translatesAutoresizingMaskIntoConstraints = false

        return container
    }()
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .systemBackground

        self.addUIAuctioneer()
        self.addUIPerson()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
 
    func addUIAuctioneer(){
        self.addSubview(auctioneer)

        NSLayoutConstraint.activate([

            self.auctioneer.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor),
            self.auctioneer.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.auctioneer.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3),
                                        
        ])
    }
    
    func addUIPerson(){

        container.addArrangedSubview(personOne)
        container.addArrangedSubview(personTwo)
        container.addArrangedSubview(personThree)

        self.addSubview(container)
        self.addSubview(lbwinner)
            
        NSLayoutConstraint.activate([

            self.container.centerYAnchor.constraint(equalTo:self.layoutMarginsGuide.centerYAnchor),
            self.container.centerXAnchor.constraint(equalTo:self.layoutMarginsGuide.centerXAnchor),

            self.container.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.container.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.container.heightAnchor.constraint(equalToConstant: 200),
            
            self.lbwinner.topAnchor.constraint(equalTo: self.container.bottomAnchor, constant: 10),
            self.lbwinner.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.lbwinner.leadingAnchor.constraint(equalTo: self.leadingAnchor),

        ])
    }

}
