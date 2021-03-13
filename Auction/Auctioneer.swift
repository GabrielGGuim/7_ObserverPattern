
import UIKit

class Auctioneer: UIView {
    
    //Atributtes
    let imPerson: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage.init(systemName: "person")
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
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
    
    let lbTime: UILabel = {
        let lb = UILabel()
        lb.backgroundColor = .gray
        lb.font = .systemFont(ofSize: 25, weight: .bold)
        lb.textAlignment = .center
        lb.text = "Time"
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
        
        addAttributes()
        addConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addAttributes(){
        self.container.addArrangedSubview(imPerson)
        self.container.addArrangedSubview(lbTime)
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
    
}
