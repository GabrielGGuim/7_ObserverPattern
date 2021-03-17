
import UIKit

class ViewController: UIViewController {
    let uiAuction = UIAuction()
    
    let viewModel = AuctioneerViewModel()
    
    override func loadView() {
        
        self.view = uiAuction

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAuctioneer()

        self.uiAuction.personOne.delegate = self
        self.uiAuction.personTwo.delegate = self
        self.uiAuction.personThree.delegate = self

    }

    
    func setupAuctioneer(){
        self.uiAuction.auctioneer.lbValue.text = String(self.viewModel.value)
        self.uiAuction.auctioneer.lbTime.text = String(self.viewModel.finishAuction)

    }
}

extension ViewController: SendValueProtocol{
    func sendValue(text: String, indentify: String) {
        self.uiAuction.auctioneer.lbValue.text = text
        
        self.viewModel.startTimer { [weak self] (time) in
            self!.uiAuction.auctioneer.lbTime.text = String(time)
        }

    }
    
    
}
