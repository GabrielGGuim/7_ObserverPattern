//
//  AuctionViewModel.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 14/03/21.
//

import Foundation

//
//protocol PersonProtocol{
//    var personValue: Float {get}
//    var personName: String {get}
//    var notificationPersonModel: PersonModel {get}
//}
//
//extension PersonModel: PersonProtocol{
//    var personValue: Float {
//        return value
//    }
//    
//    var personName: String {
//        return name
//    }
//    
//    var notificationPersonModel: PersonModel{
//        return self
//    }
//    
//    
//}
//
//class PersonViewModel{
//    
//    
//    var value = 0
//}

class AuctioneerViewModel{
    
    var finishAuction = 15
    static var arrayTimer = [Timer]()
    
    static var bindPeopleModel = Subject<Int>()

    var value = 0
    
    func startTimer(completed: @escaping ((Int)->())){

        let timerValue = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in

            if(self.finishAuction == 0){
                timer.invalidate()
            }else{
                self.finishAuction -= 1
            }
        
            completed(self.finishAuction)
        }
        self.validateTimer(time: timerValue)
    }
    
    func validateTimer(time:Timer){
   
        AuctioneerViewModel.arrayTimer.append(time)

        if(AuctioneerViewModel.arrayTimer.count > 1){
            AuctioneerViewModel.arrayTimer.first?.invalidate()
            AuctioneerViewModel.arrayTimer.removeFirst()
            self.finishAuction = 16
        }

    }

}


