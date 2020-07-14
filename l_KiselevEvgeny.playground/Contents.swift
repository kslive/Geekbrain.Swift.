import UIKit

//1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
//2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.

struct Queue<QueueT> {
    
// Свойство, которое хранит в себе все данные:
    var list = [QueueT]()
    
// Функция, которая ставит в очередь:
    mutating func enqueueInCollection(_ element: [QueueT]) {
        list.append(contentsOf: element)
    }
    
// Функция, которая удаляет из очереди:
    mutating func dequeueFromCollection() -> QueueT? {
        let resultDequeue = !list.isEmpty ? list.removeFirst() : nil
        return resultDequeue
    }
    
// Проверяет на пустоту массив, если нет, то покажет первый элемент массива:
    func showFirstElement() -> QueueT? {
        let resultPeek = !list.isEmpty ? list[0] : nil
        return resultPeek
    }
    
// Вычисляемое свойство, которое сообщает о статусе списка:
    var statusIsEmpty: String {
        let resultIsEmpty = list.isEmpty ? "Queue is free" : "Queue is full: \(list)"
        print(resultIsEmpty)
        return resultIsEmpty
    }
}



extension Queue {
    
// Фильтр массива:
    func filter(predicate: (QueueT) -> Bool) -> [QueueT] {
        var result = [QueueT]()
        for element in list {
            if predicate(element) {
                result.append(element)
            }
        }
        return result
    }
    
// Вывод nil, если не существующий индекс:
    subscript(elements: Int) -> String? {
            var answer = ""
            if elements > list.count - 1 {
                return nil
            } else {
                answer = "\(list[elements])"
            }
            return answer
        }
    
}

var queueCollection = Queue<Int>()
queueCollection.enqueueInCollection([1])
queueCollection.enqueueInCollection([2])
queueCollection.enqueueInCollection([3])
queueCollection.enqueueInCollection([4])
queueCollection.enqueueInCollection([5])

// Удаление с очереди:
queueCollection.dequeueFromCollection()

// Первый элемент массива:
queueCollection.showFirstElement()

// Статус:
queueCollection.statusIsEmpty

let filterQueueCollection = queueCollection.filter{$0 % 2 == 0}
let sorted = queueCollection.list.sorted(by: >)

// Вывод nil:
queueCollection[4]
