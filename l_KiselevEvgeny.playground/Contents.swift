import UIKit
//1. Придумать класс, методы которого могут завершаться неудачей и возвращать либо значение, либо ошибку Error?. Реализовать их вызов и обработать результат метода при помощи конструкции if let, или guard let.

struct Users {
    let nameUsers: NameUsers
    let password: Int
}

struct NameUsers {
    let name: String
}

enum AuthorizationError: Error {
    case wrongPassword
    case wrongName
}

class Authorization {
    var dataUsers = [
        "Петр I" : Users(nameUsers: NameUsers(name: "Петр I"), password: 1672),
        "Екатерина II" : Users(nameUsers: NameUsers(name: "Екатерина II"), password: 1729),
        "Николай II" : Users(nameUsers: NameUsers(name: "Николай II"), password: 1868)
    ]
    
    func login(name: String, password: Int) -> (NameUsers?, AuthorizationError?) {
        
        // Проверка на наличия такого пользователя:
        guard let users = dataUsers[name] else {
            return (nil, .wrongName)
        }
        
        // Проверка на соответствие пароля:
        guard users.password == password else {
            return (nil, .wrongPassword)
        }
    
        return (users.nameUsers,nil)
    }
}

let user = Authorization()
let PeterNumberOne = user.login(name: "Петр I", password: 1672)

if let client = PeterNumberOne.0 {
    print("Welcome, \(client.name)!")
} else if let error = PeterNumberOne.1{
    print("Ошибка: \(error.self)")
}


let NicholasNumberTwo = user.login(name: "Николай I", password: 1868)

if let client = NicholasNumberTwo.0 {
    print("Welcome, \(client.name)!")
} else if let error = NicholasNumberTwo.1{
    print("Ошибка: \(error.self)")
}

//2. Придумать класс, методы которого могут выбрасывать ошибки. Реализуйте несколько throws-функций. Вызовите их и обработайте результат вызова при помощи конструкции try/catch.

// Причины, по которым нельзя снять наличку:
enum ATMError: Error {
    case emptyATM
    case emptyBalanceOnTheCard
    case ATMLostConnectionWithTheServer
}

// Сумма для снятия:
struct Balance {
    var moneyToWithdraw: Double
}

// Банковский автомат:
class ATM {
    
// Денег на карте:
    private var moneyLeft: Double
// Денег в банкомате:
    private var moneyInATM: Double
// Связь банкомата с сервером:
    private var connectionWithTheServer: Bool
    
// Снятие наличных:
    func getMoney(moneyToWithdraw: Balance) throws {
        
        // Связь с сервером:
        guard connectionWithTheServer == true else {
            throw ATMError.ATMLostConnectionWithTheServer
        }
        // Баланс на карте:
        guard moneyLeft >= moneyToWithdraw.moneyToWithdraw else {
            throw ATMError.emptyBalanceOnTheCard
        }
        // Доступно средств в банкомате:
        guard moneyInATM >= moneyToWithdraw.moneyToWithdraw else {
            throw ATMError.emptyATM
        }
        
        // Списываем деньги с карты и баланса банкомата:
        moneyLeft = self.moneyLeft - moneyToWithdraw.moneyToWithdraw
        moneyInATM = self.moneyInATM - moneyToWithdraw.moneyToWithdraw
    }
    
// Узнать баланс/баланс банкомата/связь с сервером:
    func getDescription(selectOperationNumber: Int) -> () {
        switch selectOperationNumber {
        case 1:
            return print("Осталось денег на карте: \(moneyLeft)")
        case 2:
            return print("Осталось денег в банкомате: \(moneyInATM)")
        case 3:
            return print("Связь с сервером: \(connectionWithTheServer)")
        default:
            return print("""
Введена не верная команда!
1 - узнать баланс на карте,
2 - узнать баланс банкомата,
3 - узнать соединение с сервером.
""")
        }
    }
    
// Изменение начальных параметров:
    init(moneyLeft: Double, moneyInATM: Double, connectionWithTheServer: Bool) {
        self.moneyLeft = moneyLeft
        self.moneyInATM = moneyInATM
        self.connectionWithTheServer = connectionWithTheServer
    }
}

// Снятие произошло:
let operationFirst = ATM(moneyLeft: 100_000, moneyInATM: 50_000, connectionWithTheServer: true)
do {
    try operationFirst.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 50_000))
} catch ATMError.emptyATM {
    print("В банкомате недостаточно средств!")
} catch ATMError.ATMLostConnectionWithTheServer {
    print("Потеряна связь с сервером!")
} catch ATMError.emptyBalanceOnTheCard {
    print("Денег на карте не достаточно для снятия!")
}
operationFirst.getDescription(selectOperationNumber: 1)
operationFirst.getDescription(selectOperationNumber: 2)
operationFirst.getDescription(selectOperationNumber: 3)

// Потеряна связь с сервером:
let operationTwo = ATM(moneyLeft: 1_000, moneyInATM: 2_000, connectionWithTheServer: false)
do {
    try operationTwo.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 1_000))
} catch ATMError.emptyATM {
    print("В банкомате недостаточно средств!")
} catch ATMError.ATMLostConnectionWithTheServer {
    print("Потеряна связь с сервером!")
} catch ATMError.emptyBalanceOnTheCard {
    print("Денег на карте не достаточно для снятия!")
}
operationTwo.getDescription(selectOperationNumber: 1)
operationTwo.getDescription(selectOperationNumber: 2)
operationTwo.getDescription(selectOperationNumber: 3)

// Денег на карте не достаточно для снятия:
let operationThree = ATM(moneyLeft: 1_000, moneyInATM: 2_000, connectionWithTheServer: true)
do {
    try operationThree.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 1_500))
} catch ATMError.emptyATM {
    print("В банкомате недостаточно средств!")
} catch ATMError.ATMLostConnectionWithTheServer {
    print("Потеряна связь с сервером!")
} catch ATMError.emptyBalanceOnTheCard {
    print("Денег на карте не достаточно для снятия!")
}
operationThree.getDescription(selectOperationNumber: 1)
operationThree.getDescription(selectOperationNumber: 2)
operationThree.getDescription(selectOperationNumber: 3)

// В банкомате недостаточно средств:
let operationFour = ATM(moneyLeft: 1_000, moneyInATM: 500, connectionWithTheServer: true)
do {
    try operationFour.getMoney(moneyToWithdraw: .init(moneyToWithdraw: 1_000))
} catch ATMError.emptyATM {
    print("В банкомате недостаточно средств!")
} catch ATMError.ATMLostConnectionWithTheServer {
    print("Потеряна связь с сервером!")
} catch ATMError.emptyBalanceOnTheCard {
    print("Денег на карте не достаточно для снятия!")
}
operationFour.getDescription(selectOperationNumber: 1)
operationFour.getDescription(selectOperationNumber: 2)
operationFour.getDescription(selectOperationNumber: 3)
