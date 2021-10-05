import UIKit
import RxSwift
import Metal
/*
// 유튜버
let observable = Observable.just(1) // 1에 반응

//1,2,3에 반응
let observable2 = Observable.of(1, 2, 3) // Observable<Int>

// [1,2,3]에 반응
let observable3 = Observable.of([1,2,3]) // Observable<[Int]> 이렇게 하면 개별 Int가 아니라 Int 배열

// 1, 2, 3, 4, 5 개별 Int에 반응
let observable4 = Observable.from([1,2,3,4,5]) // Observable<Int>

// 구독자

// 구독하면 값이나 변수에 액세스 가능
observable4.subscribe { event in
    print(event)
}

// 값은 어떻게 얻을까?
// 우리는 event 관찰보다 value에 관심있음

observable4.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

// observable3을 보자. 이건 배열 하나로 끝남
observable3.subscribe { event in
    if let element = event.element {
        print(element) // [1,2,3]
    }
}

// Observable.of(1,2,3) == Observable.from([1,2,3])
observable2.subscribe { event in
    if let element = event.element {
        print(element)
    }
}

// element에 바로 접근할 수 있는 방법
observable4.subscribe(onNext: { element in
    print(element)
})
*/

// dispose
let disposeBag = DisposeBag()

Observable.of("A", "B", "C")
    .subscribe {
        print($0)
    }.disposed(by: disposeBag)

// 구독 만드는 또 다른 방법

Observable<String>.create { observer in
    observer.onNext("A")
    observer.onCompleted()
    observer.onNext("?") // 이건 절대 호출되지 않음
    return Disposables.create()
}.subscribe(onNext: {print($0)}, onError: {print($0)}, onCompleted: {print("Completed")}, onDisposed: {print("Disposed")})
    .disposed(by: disposeBag)
