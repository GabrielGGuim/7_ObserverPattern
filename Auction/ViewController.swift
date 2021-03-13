
import UIKit

class ViewController: UIViewController {
    let uiAuction = UIAuction()
    
    override func loadView() {
        
        self.view = uiAuction
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }
}

