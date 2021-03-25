
import UIKit

class ViewController: UIViewController {
    let uiAuction = UIAuction()
    
    let viewModel = AuctionViewModel()
    
    override func loadView() {
        
        self.view = uiAuction

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.uiAuction.personOne.delegate = self
        self.uiAuction.personTwo.delegate = self
        self.uiAuction.personThree.delegate = self
        
        self.viewModel.bind.register(self.uiAuction.personOne)
        self.viewModel.bind.register(self.uiAuction.personTwo)
        self.viewModel.bind.register(self.uiAuction.personThree)
        self.viewModel.bind.register(self.uiAuction.auctioneer)

        
    }

}

extension ViewController: SendValueProtocol{
    func sendValue(text: String, indentify: String) {
        
        self.viewModel.bind.value = Int(text)!
        
        self.viewModel.startTimer { [weak self] (time) in
            self!.uiAuction.auctioneer.lbTime.text = String(time)
        } completedTimer: {
            self.uiAuction.lbwinner.text = indentify
        }

    }
    
}
