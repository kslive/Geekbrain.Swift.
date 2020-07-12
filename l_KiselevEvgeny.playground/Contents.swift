import UIKit

enum EngineStatus: String {
    case start = "engine start"
    case stop = "engine stop"
}

enum WindowsStatus: String {
    case open = "windows open"
    case close = "windows close"
}

//1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
protocol Car {
    var model: String { get }
    var engineStatus: EngineStatus { get set }
    var windowsStatus: WindowsStatus { get set }
    
    mutating func getEngineStatus()
    mutating func getWindowsStatus()
}

//2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
extension Car {
    mutating func getEngineStatus() {
        switch engineStatus {
        case .start:
            return self.engineStatus = .start
        case .stop:
            return self.engineStatus = .stop
        }
    }
    
    mutating func getWindowsStatus() {
        switch windowsStatus {
        case .open:
            return self.windowsStatus = .open
        case .close:
            return self.windowsStatus = .close
        }
    }
}

//3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
class SportCar: Car {
    var model: String
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    private let maxSpeed: Double
    
    init(model: String, engineStatus: EngineStatus, windowsStatus: WindowsStatus, maxSpeed: Double) {
        self.model = model
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.maxSpeed = maxSpeed
    }
}

class TrunkCar: Car {
    var model: String
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    var volumeTrunkStatus: VolumeTrunkStatus
    
    enum VolumeTrunkStatus: String {
        case full = "trunk is full"
        case empty = "trunk is empty"
    }
    
    func getStatusVolumeTrunk() {
        switch volumeTrunkStatus {
        case .empty:
            return volumeTrunkStatus = .empty
        case .full:
            return volumeTrunkStatus = .full
        }
    }
    
    init(model: String, engineStatus: EngineStatus, windowsStatus: WindowsStatus, volumeTrunkStatus: VolumeTrunkStatus) {
        self.model = model
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.volumeTrunkStatus = volumeTrunkStatus
    }
}

//4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
extension SportCar: CustomStringConvertible {
    var description: String {
        return """
        Model: \(model),
        Engine Status: \(engineStatus.rawValue),
        Windows Status: \(windowsStatus.rawValue),
        Max Speed: \(maxSpeed).
        """
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return """
        Model: \(model),
        Engine Status: \(engineStatus.rawValue),
        Windows Status: \(windowsStatus.rawValue),
        Volume Trunk Status: \(volumeTrunkStatus.rawValue).
        """
    }
}

//5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var ladaSedan = SportCar(model: "Lada Sedan", engineStatus: .start, windowsStatus: .close, maxSpeed: 666)
ladaSedan.windowsStatus = .open
ladaSedan.engineStatus = .stop

var gazel = TrunkCar(model: "Gazel GLE", engineStatus: .stop, windowsStatus: .close, volumeTrunkStatus: .full)
gazel.engineStatus = .start
gazel.windowsStatus = .open
gazel.volumeTrunkStatus = .empty

//6. Вывести сами объекты в консоль.
print(ladaSedan)
print(gazel)
