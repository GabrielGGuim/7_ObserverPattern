
import Foundation

protocol Observer {
    func update(_ notifyValue: Any)
    var id:String {get set}
}


class Subject<T>{

    var observers: [Observer] = [Observer]()
    
    var updateValueNotification: (() -> ()) = {}

    
    //change
    var value: T?{
        didSet{
            if let value = value{
                notify(with: value)
                   
            }
        }
    }

    //register
    func register(_ observer: Observer){
        
        if observers.isEmpty{
            observers.append(observer)
        }
        
        for i in observers{
            if(i.id != observer.id){
                observers.append(observer)
            }
        }

    }

    //call notify
    func notify(with: T){
        for observer in observers{
            observer.update(value as Any)
            updateValueNotification()
        }
    }
    
    func remove(_ observer: Observer){
        for (i,j) in observers.enumerated(){
            if(j.id == observer.id){
                observers.remove(at: i)
            }
        }
    }
   
}
