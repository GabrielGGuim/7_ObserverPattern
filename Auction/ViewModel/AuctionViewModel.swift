//
//  AuctionViewModel.swift
//  Auction
//
//  Created by Gabriel Gonçalves Guimarães on 14/03/21.
//

import Foundation


protocol PersonProtocol{
    var personValue: Float {get}
    var personName: String {get}
    var notificationPersonModel: PersonModel {get}
}

extension PersonModel: PersonProtocol{
    var personValue: Float {
        return value
    }
    
    var personName: String {
        return name
    }
    
    var notificationPersonModel: PersonModel{
        return self
    }
    
    
}

class PersonViewModel{
    
    static var bindPeopleModel = Subject<Float>()
    
    var value = 0
}

class AuctioneerViewModel{
    
    var finishAuction = 15
    
    var value = 0
    
//    var updateTimer:
    
//    typealias update = updateTimer
    
    func startTimer(completed: @escaping ((Int)->())){
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            
            self.finishAuction -= 1
            print(self.finishAuction)
            
            if(self.finishAuction == 0){
                timer.invalidate()
            }
            
            completed(self.finishAuction)
        }
    }
    
//    func sendValue(value: Int){
//        print("ola?")
//        self.startTimer()
//        self.value = value
//    }
}


