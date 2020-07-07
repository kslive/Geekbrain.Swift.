import UIKit
//1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
//2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
//3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
//4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
//5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
//6. Вывести значения свойств экземпляров в консоль.

enum engineStatus {
    case start, stop
}

enum windowStatus {
    case open, close
}

enum trunkStatus {
    case full, empty
}

struct PassengerCar {
    let carModel: String
    let yearOfIssueCar: Int
    var colorCar: String
    var trunkStatus: trunkStatus
    
    var volumeTrunk: Double! {
        willSet {
            if (trunkStatus == .empty) && (volumeTrunk > 0) && (volumeTrunk != 0) && (newValue < volumeTrunk) {
                let freeVolumeTrunk = volumeTrunk - newValue
                print("\(carModel) trunk volume free: \(freeVolumeTrunk)")
            }
        }
    }
    
    var engineStatus: engineStatus! {
        willSet {
            if newValue == .start {
                print("\(carModel) engine is On")
            } else {
                print("\(carModel) engine is Off")
            }
        }
    }
    
    var windowStatus: windowStatus! {
        willSet {
            if newValue == .open {
                print("\(carModel) windows are Open")
            } else {
                print("\(carModel) windows are Close")
            }
        }
    }
    
    
    mutating func changeColorCar(colors: String) {
        switch colors {
        case "white":
            colorCar = "white"
        case "black":
            colorCar = "black"
        case "red":
            colorCar = "red"
        default:
            print("Machine exists in 3 colors: white, black, red")
        }
        
        func emptyTrunk() {
            trunkStatus = .empty
            print("\(carModel) trunk is Empty")
        }
    }
}

struct Truck {
    let carModel: String
    let yearOfIssueCar: Int
    var colorCar: String
    var trunkStatus: trunkStatus
    
    var volumeTrunk: Double! {
        willSet {
            if (trunkStatus == .empty) && (volumeTrunk > 0) && (volumeTrunk != 0) && (newValue < volumeTrunk) {
                let freeVolumeTrunk = volumeTrunk - newValue
                print("\(carModel) trunk volume free: \(freeVolumeTrunk)")
            }
        }
    }
    
    var engineStatus: engineStatus! {
        willSet {
            if newValue == .start {
                print("\(carModel) engine is On")
            } else {
                print("\(carModel) engine is Off")
            }
        }
    }
    
    var windowStatus: windowStatus! {
        willSet {
            if newValue == .open {
                print("\(carModel) windows are Open")
            } else {
                print("\(carModel) windows are Close")
            }
        }
    }
    
    
    mutating func changeColorCar(colors: String) {
        switch colors {
        case "white":
            colorCar = "white"
        case "black":
            colorCar = "black"
        case "red":
            colorCar = "red"
        default:
            print("Machine exists in 3 colors: white, black, red")
        }
        
        func emptyTrunk() {
            trunkStatus = .empty
            print("\(carModel) trunk is Empty")
        }
    }
}

var carBMW = PassengerCar(carModel: "BMW x1", yearOfIssueCar: 2020, colorCar: "white", trunkStatus: .empty, volumeTrunk: 500, engineStatus: .stop, windowStatus: .close)
var carLada = PassengerCar(carModel: "Lada 2107", yearOfIssueCar: 1997, colorCar: "black", trunkStatus: .empty, volumeTrunk: 400, engineStatus: .stop, windowStatus: .open)

var truckGazel = Truck(carModel: "Gazel", yearOfIssueCar: 2000, colorCar: "red", trunkStatus: .empty, volumeTrunk: 1000, engineStatus: .start, windowStatus: .open)
var truckGAZ = Truck(carModel: "GAZ", yearOfIssueCar: 2001, colorCar: "black", trunkStatus: .full, volumeTrunk: 1000, engineStatus: .start, windowStatus: .none)

carBMW.engineStatus = .start
carBMW.volumeTrunk = 200
carBMW.windowStatus = .open

carLada.engineStatus = .start
carLada.volumeTrunk = 399
carLada.windowStatus = .close

print("""
    Model: \(carBMW.carModel),
    year: \(carBMW.yearOfIssueCar),
    color: \(carBMW.colorCar),
    free volume trunk: \(carBMW.volumeTrunk ?? 0)
    engine is \(carBMW.engineStatus!)
    """)

