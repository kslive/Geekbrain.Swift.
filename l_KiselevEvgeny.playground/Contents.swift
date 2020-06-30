import UIKit

//  1. Написать функцию, которая определяет, четное число или нет.
func evenDefine(number: Int) {
    if number % 2 == 0 {
        print("\(number) четное число")
    } else {
        print("\(number) не четное число")
    }
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divideByThree(number: Int) {
    if number % 3 == 0 {
        print("\(number) делится на 3")
    } else {
        print("\(number) не делится на 3")
    }
}

// 3. Создать возрастающий массив из 100 чисел.
var number = 1
var array: Array<Int> = []
while number <= 100 {
    array.append(number)
    number += 1
}

// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
for elements in array {
    if elements % 2 == 0 || elements % 3 == 0 {
        array.remove(at: (array.firstIndex(of: elements)!))
    }
}

// 5. *Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
func fibonacci(n: Int) -> Double {
    if n <= 2 {
        return 1
    } else {
        var x1: Double = 1
        var x2: Double = 1
        var x: Double
        for _ in 3...n {
            x = x1 + x2
            x1 = x2
            x2 = x
        }
        return x2
    }
}

var arrayWithFibonacci: Array<Double> = []
for m in 1...100 {
    arrayWithFibonacci.append(fibonacci(n: m))
}

/* 6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.
*/
func addPrime() -> [Int] {
    var result: Array<Int> = []
    var number = 2
    while result.count <= 100 {
        if (number / number == 1) && (number / 1 == number) {
            result.append(number)
        }
        number += 1
    }
    return result
}
print(addPrime())
