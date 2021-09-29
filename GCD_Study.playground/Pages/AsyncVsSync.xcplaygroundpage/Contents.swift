//: [Previous](@previous)

import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

/*:
# 비동기 VS 동기

 비동기: 작업을 다른 스레드로 보낸 후, 기다리지 않고 바로 다음 작업 실행
 동기: 작업을 다른 스레드로 보낸 후, 그 작업이 끝나면 다음 작업 실행
 
## 비동기
*/

let queue = DispatchQueue.global()

func task1() {
    print("Task 1 start")
    sleep(1)
    print("Task1 finished❗️")
}
func task2() {
    print("Task 2 start")
    print("Task2 finished❗️")
}
func task3() {
    print("Task 3 start")
    sleep(4)
    print("Task3 finished❗️")
}

func task4() {
    print("Task 4 start")
    sleep(3)
    print("Task 4 finished❗️")
}

/*:
 비동기는 작업을 다른 스레드로 보내고 나서 바로 리턴함.
 그걸 확인하기 위해 timeCheck를 사용
 0.0004179.. 만에 바로 리턴하는 걸 확인할 수 있음
 */
timeCheck {
    queue.async {
        task1()
    }

    queue.async {
        task2()
    }

    queue.async {
        task3()
    }
}

//: ## 동기

//: 이 경우에는 모두 메인스레드에서 동작하는 동기
task1()
task2()
task3()
task4()

/*:
 동기의 경우 작업이 끝날 때까지 기다림. task1~4를 다 끝내는데 걸린 시간 8.0034919
 */
timeCheck {
    queue.sync {
        task1()
    }
    
    queue.sync {
        task2()
    }
    
    queue.sync {
        task3()
    }
    
    queue.sync {
        task4()
    }
}

PlaygroundPage.current.finishExecution()
//: [Next](@next)
