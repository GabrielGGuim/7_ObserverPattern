
import Foundation

class AuctionViewModel{
    
    var finishAuction = 7
    static var arrayTimer = [Timer]()
    
    var bind = Subject<Int>()
    
    func startTimer(changedTimer: @escaping ((Int)->()), completedTimer: @escaping (()->()) ){

        let timerValue = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in

            if(self.finishAuction == 0){
                timer.invalidate()
                completedTimer()
            }else{
                self.finishAuction -= 1
            }
            changedTimer(self.finishAuction)
        }
        self.validateTimer(time: timerValue)
    }
    
    func validateTimer(time:Timer){
   
        AuctionViewModel.arrayTimer.append(time)

        if(AuctionViewModel.arrayTimer.count > 1){
            AuctionViewModel.arrayTimer.first?.invalidate()
            AuctionViewModel.arrayTimer.removeFirst()
            self.finishAuction = 8
        }

    }

}


