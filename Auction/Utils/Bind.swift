
import Foundation

protocol Observer {
    func update(_ notifyValue: Any)
}

class Subject<T>{

    var observers: [Observer] = [Observer]()
    
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
        observers.append(observer)
    }

    //call notify
    func notify(with: T){
        for observer in observers{
            observer.update(value as Any)
        }
    }
}
