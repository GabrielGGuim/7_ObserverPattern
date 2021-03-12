//
//  ViewController.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 09/03/21.
//

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

