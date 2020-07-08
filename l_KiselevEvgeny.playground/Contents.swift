import UIKit

//1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
enum status {
    
    enum engineStatus {
        case start, stop
    }
    
    enum windowStatus {
        case open, close
    }
    
    enum trunkStatus {
        case full, empty
    }
}
enum bodyMaterials {
    
    case steel, aluminum, plastic, composite
}

enum tires {
    
    case summerTires, winterTires
}

enum doorsCount {
    
    case one, two, three, four
}

enum windowCount {
    
    case two, four
}

class Car {
    
    private var bodyMaterials: bodyMaterials
    private var tires: tires
    private var doorsCount: doorsCount
    private var windowCount: windowCount
    
    var engineStatus: status.engineStatus! {
        willSet {
            if newValue == .start {
                print("- Engine is On -")
            } else {
                print("- Engine is Off -")
            }
        }
    }
    
    var windowStatus: status.windowStatus! {
        willSet {
            if newValue == .open {
                print("- Windows are Open -")
            } else {
                print("- Windows are Close -")
            }
        }
    }
    
    func printMachineDescription() {
        print("""
            Materials body: \(bodyMaterials),
            Tires: \(tires),
            Count door: \(doorsCount),
            Count windows: \(windowCount),
            Engine status: \(engineStatus!),
            Status window: \(windowStatus!)
            """)
    }
    
    init(bodyMaterials: bodyMaterials, tires: tires, doorsCount: doorsCount, windowCount: windowCount, engineStatus: status.engineStatus, windowStatus: status.windowStatus) {
        self.bodyMaterials = bodyMaterials
        self.tires = tires
        self.doorsCount = doorsCount
        self.windowCount = windowCount
        self.engineStatus = engineStatus
        self.windowStatus = windowStatus
    }
}

//2. Описать пару его наследников trunkCar и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.
//3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет trunkCar, а какие – sportCar. Добавить эти действия в перечисление.
//4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

class TrunkCar: Car {
    
    var trunkStatus: status.trunkStatus
    
    var volumeTrunk: Double! {
        willSet {
            if (trunkStatus == status.trunkStatus.empty) && (volumeTrunk > 0) && (volumeTrunk != 0) && (newValue < volumeTrunk) {
                let freeVolumeTrunk = volumeTrunk - newValue
                print("- Trunk volume free: \(freeVolumeTrunk) -")
            }
        }
    }
    
    func emptyTrunk() {
        trunkStatus = .empty
        print("- Trunk is Empty -")
    }
    
    override func printMachineDescription() {
        print("""
            Materials body: \(bodyMaterials.self),
            Tires: \(tires.self),
            Count door: \(doorsCount.self),
            Count windows: \(windowCount.self),
            Engine status: \(engineStatus!),
            Status window: \(windowStatus!),
            Status trunk: \(trunkStatus),
            Volume trunk: \(volumeTrunk!)
            """)
    }
    
    init(bodyMaterials: bodyMaterials, tires: tires, doorsCount: doorsCount, windowCount: windowCount, engineStatus: status.engineStatus, windowStatus: status.windowStatus, trunkStatus: status.trunkStatus, volumeTrunk: Double) {
        self.trunkStatus = trunkStatus
        self.volumeTrunk = volumeTrunk
        super.init(bodyMaterials: bodyMaterials, tires: tires, doorsCount: doorsCount, windowCount: windowCount, engineStatus: engineStatus, windowStatus: windowStatus)
    }
}

class SportCar: Car {
    
    var maxSpeed: Double
    var weightSportCar: Double
    
    override func printMachineDescription() {
        print("""
            Materials body: \(bodyMaterials.self),
            Tires: \(tires.self),
            Count door: \(doorsCount.self),
            Count windows: \(windowCount.self),
            Engine status: \(engineStatus!),
            Status window: \(windowStatus!)
            Maximum speed: \(maxSpeed),
            Weight car: \(weightSportCar)
            """)
    }
    
    init(bodyMaterials: bodyMaterials, tires: tires, doorsCount: doorsCount, windowCount: windowCount, engineStatus: status.engineStatus, windowStatus: status.windowStatus, maxSpeed: Double, weightSportCar: Double) {
        self.maxSpeed = maxSpeed
        self.weightSportCar = weightSportCar
        super.init(bodyMaterials: bodyMaterials, tires: tires, doorsCount: doorsCount, windowCount: windowCount, engineStatus: engineStatus, windowStatus: windowStatus)
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.

var BMW = Car(bodyMaterials: .aluminum,
              tires: .summerTires,
              doorsCount: .four,
              windowCount: .four,
              engineStatus: .start,
              windowStatus: .close)
BMW.engineStatus = .stop
BMW.windowStatus = .open

var gazel = TrunkCar(bodyMaterials: .aluminum,
                     tires: .summerTires,
                     doorsCount: .two,
                     windowCount: .two,
                     engineStatus: .stop,
                     windowStatus: .close,
                     trunkStatus: .empty,
                     volumeTrunk: 1000)
gazel.trunkStatus = .full
gazel.engineStatus = .start

var bugattiVeyron = SportCar(bodyMaterials: .composite,
                             tires: .summerTires,
                             doorsCount: .two,
                             windowCount: .two,
                             engineStatus: .stop,
                             windowStatus: .close,
                             maxSpeed: 418,
                             weightSportCar: 1800)
bugattiVeyron.engineStatus = .start
bugattiVeyron.windowStatus = .open

//6. Вывести значения свойств экземпляров в консоль.

BMW.printMachineDescription()
gazel.printMachineDescription()
bugattiVeyron.printMachineDescription()

