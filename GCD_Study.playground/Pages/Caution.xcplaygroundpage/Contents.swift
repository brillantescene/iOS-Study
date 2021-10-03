//: [Previous](@previous)

import Foundation

/*:
 
# 디스패치큐(GCD) 사용시 주의해야할 사항
 
## 1. 반드시 메인큐에서 처리해야 하는 작업

UI 관련 일들은 "메인큐"에서 처리해야 한다. 한 스레드에서 진행해야지 간섭이 일어나지 않고 순서대로 처리가 가능하다.

![스크린샷 2021-10-03 오전 11.56.18.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/574feb67-cee0-42cc-8316-8b84cbdbb61e/스크린샷_2021-10-03_오전_11.56.18.png)

그래서 다른 스레드에서 수행한 작업의 마지막에 UI 관련 작업이 있다면 그걸 메인큐로 보내줘야 함. 그래야 화면에 표시될 수 있음.

오래 걸리는 작업이니까 비동기로 분산해서 작업을 처리하고 싶은거임. 그래서 global 큐로 보내서 다른 스레드로 보냈음. 그런데 그 안에 화면에 표시해야되는 UI관련 작업이 있는거지. 그건 다시 메인큐로 보내줘야함.

```swift
DispatchQueue.global().async {
    // 이미지 다운로드 등

    DispatchQueue.main.async {
        // 다운로드한 이미지 표시 코드
        self.imageView.image = image
    }
}
```

## 2. sync 메서드에 대한 주의사항

1. 메인큐에서 다른 큐로 보낼 때 sync 메서드로 부르면 절대 안된다.

- 메인큐에서는 항상 비동기적으로 보내야한다.
- 동기적으로 시키면 UI가 멈춰서 버벅거림.

```swift
// 현재 메인에서 일하는 중
DispatchQueue.global().sync { // 이렇게 절대 하지 말 것!
}
```

2. 현재 큐에서 현재 큐로 "동기적"으로 보내서는 안된다.

- 현재의 큐를 블락하는 동시에 다시 현재의 큐에 접근하기 때문에 교착상황(deadlock)이 발생함.

이런 상황을 말하는건데, 보통 이런 실수는 하지 않지.

```swift
DispatchQueue.global().async {
        DispatchQueue.global().sync {
        }
}
```

이렇게 됐을 때 문제가 발생하는겨. 이게 위의 코드와 똑같은 상황임.

![스크린샷 2021-10-03 오후 12.12.05.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/772efd94-59a2-446a-9f78-39d4a0a7c38e/스크린샷_2021-10-03_오후_12.12.05.png)

물론 다른 스레드가 있어서 2번 스레드를 제외한 곳에 배치되면 괜찮음. 하지만 언제나 데드락을 내포하는 코드이기 때문에 쓰지 말 것

![스크린샷 2021-10-03 오후 12.13.39.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/8df515db-2319-4fb7-9c1d-ec09ecf32426/스크린샷_2021-10-03_오후_12.13.39.png)

## 3. weak, strong 캡쳐 주의

작업을 보내는 일은 **클로저**를 보내는 거임.

```swift
DispatchQueue.global(qos: .utility).async { **[weak self]** in
    guard let self = self else { return }
    
    DispatchQueue.main.async {
        self.textLabel.text = "New posts updated!"
    }
}
```

클로저를 보내는 일이기 때문에 객체에 대한 캡쳐 현상이 일어남.

## 4. (비동기 작업에서) completionHandler의 존재 이유

completionHandler: 어떤 작업이 끝났음을 알리는 클로저

![스크린샷 2021-10-03 오후 12.31.49.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5dce91bf-ee48-44f2-9df5-db553c89799e/스크린샷_2021-10-03_오후_12.31.49.png)

## 5. 동기적 함수를 비동기 함수처럼 만드는 방법

왜 이런 일을 해? ⇒ 재활용 하기 위해

동기 함수가 너무 오래걸리는거야 그래서 내부적으로 비동기식으로 작업하게 하고 싶어

아 동기 함수를 비동기식으로 동작하게 하는 함수를 새로 만들어서 그걸 쓰도록 하는거네

tiltShift 함수

```swift
// 오랜시간이 걸리는 동기적으로 처리하는 함수(동기 함수)
public func tiltShift(image: UIImage?) -> UIImage? {
    guard let image = image else { return nil }
    sleep(1)
    let mask = topAndBottomGradient(size: image.size)
    return image.applyBlur(radius: 6, maskImage: mask)
}
```

```swift
// 동기적 함수를 비동기적 함수로 바꿔서 지속적으로 사용할 수 있도록 만들기
// 결국 (기존 함수의 내용 +)
// 1) 직접적으로 작업을 실행할 큐와
// 2) 작업을 마치고나서의 큐
// 3) 컴플리션핸들러 필요
// 4) 에러처리에 대한 내용

func asyncTiltShift(_ inputImage: UIImage?, runQueue: DispatchQueue, completionQueue: DispatchQueue, completion: @escaping (UIImage?, Error?) -> ()) {
    
    runQueue.async {
        var error: Error?
        error = .none // 에러 없다고 가정
        
        let outputImage = tiltShift(image: inputImage)
        
        completionQueue.async {
            completion(outputImage, error)
        }
    }
}
```

- `runQueue: DispatchQueue` → 실행할 큐
- `completionQueue: DispatchQueue` → 작업이 끝났을 때 끝난 처리를 수행할 큐

```swift
let workingQueue = DispatchQueue(label: "com.inflearn.serial")
let resultQueue = DispatchQueue.main()

print("==== 비동기함수의 작업 시작 ====")
asyncTiltShift(image, runQueue: workingQueue, completionQueue: resultQueue) { image, error in
    image
    print("★★★비동기작업의 실제 종료시점★★★")
}
```
 */
//: [Next](@next)
