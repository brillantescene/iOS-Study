//
//  ViewController.swift
//  RxSwift+MVVM
//
//  Created by iamchiwon on 05/08/2019.
//  Copyright © 2019 iamchiwon. All rights reserved.
//

import RxSwift
import SwiftyJSON
import UIKit

let MEMBER_LIST_URL = "https://my.api.mockaroo.com/members_with_avatar.json?key=44ce18f0"

class 나중에생기는데이터<T> {
    private let task: (@escaping (T) -> Void) -> Void
    
    init(task: @escaping (@escaping (T) -> Void) -> Void) {
        self.task = task
    }
    
    func 나중에오면(_ f: @escaping (T) -> Void) {
        task(f)
    }
}
class ViewController: UIViewController {
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var editView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { [weak self] _ in
            self?.timerLabel.text = "\(Date().timeIntervalSince1970)"
        }
    }

    private func setVisibleWithAnimation(_ v: UIView?, _ s: Bool) {
        guard let v = v else { return }
        UIView.animate(withDuration: 0.3, animations: { [weak v] in
            v?.isHidden = !s
        }, completion: { [weak self] _ in
            self?.view.layoutIfNeeded()
        })
    }

    // 보통 처리하는 방법
    /*
    func downloadJson(_ url: String, _ completion: @escaping (String?) -> Void) {
        DispatchQueue.global().async {
            let url = URL(string: url)!
            let data = try! Data(contentsOf: url)
            let json = String(data: data, encoding: .utf8)
            DispatchQueue.main.async {
                completion(json)
            }
        }
    }
    */
    
    /** 나중에 생기는 데이터로 설명을 해보자
     func downloadJson(_ url: String) -> 나중에생기는데이터<String?> { // 나중에생기는데이터 => Observable
         return 나중에생기는데이터() { f in
             DispatchQueue.global().async {
                 let url = URL(string: url)!
                 let data = try! Data(contentsOf: url)
                 let json = String(data: data, encoding: .utf8)
                 DispatchQueue.main.async {
                     f(json)
                 }
             }
         }
     }
     */
    func downloadJson(_ url: String) -> Observable<String?> {
        
//        sugar API
//         "Hello World"같이 데이터 하나 보낼 때 create onNext onCompleted Diposables 하기 너무 귀찮잖아
//         그럴 때 쓰는게 just, from 이런거임
//        return Observable.just("Hello World") // 값 하나라는 뜻
//        return Observable.from(["Hello", "World"])
        
        
        return Observable.create() { emitter in
            let url = URL(string: url)!
            let task = URLSession.shared.dataTask(with: url) { (data, _, err) in
                guard err == nil else {
                    emitter.onError(err!)
                    return
                }

                if let dat = data, let json = String(data: dat, encoding: .utf8) {
                    emitter.onNext(json)
                }
                
                emitter.onCompleted()
            }
            
            task.resume()
            
            return Disposables.create {
                //subscribe에 있는 disposable을 사용하면 여기가 실행됨.
                task.cancel()
            }
        }
        // 1. 비동기로 생기는 데이터를 Observable로 감싸서 리턴하는 방법
//        return Observable.create() { f in
//            DispatchQueue.global().async {
//                let url = URL(string: url)!
//                let data = try! Data(contentsOf: url)
//                let json = String(data: data, encoding: .utf8)
//                DispatchQueue.main.async {
//                    f.onNext(json)
//                    f.onCompleted() // 일 다하면 사라져라
//                }
//            }
//            return Disposables.create()
//        }
    }
    
    // MARK: SYNC
    // sync를 async로 바꿔라 !
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    @IBAction func onLoad() {
        editView.text = ""
        setVisibleWithAnimation(activityIndicator, true)
        
        /** 나중에 생기는 데이터로 설명을 해보자
         let json:나중에생기는데이터<String?> = downloadJson(MEMBER_LIST_URL)
         
         json.나중에오면 { json in // 나중에오면 => subscribe
             self.editView.text = json
             self.setVisibleWithAnimation(self.activityIndicator, false)
         }
         **/
        
        // 2. Observalbe로 오는 데이터를 받아서 처리하는 방법
        // [weak self]가 없네여?
        // 순환 참조 생김. 클로저가 self 붙은 애들을 캡쳐하면서 카운트가 증가해서 생기는거잖아
        // 근데 클로저가 사라져 버리면? 카운트도 줄어들겠지
        // 위에서 f.onCompleted() 해놓아서 completed, error에서 클로저가 스스로 사라짐. 순환참조 해결
        
//        downloadJson(MEMBER_LIST_URL).subscribe { event in // subscribe는 event가 옴.
//            switch event {
//            case .next(let json):
//                //URLSession은 기본적으로 다른 스레드에서 동작하기 때문에 main 스레드로 보내줘야함
//                DispatchQueue.main.async {
//                    self.editView.text = json
//                    self.setVisibleWithAnimation(self.activityIndicator, false)
//                }
//            case .completed:
//                break
//            case .error(let err):
//                break
//            }
//        }
        
//        이 방법 귀찮을 떄 sugar api
//        next만 처리할래, onCompleted도 할래 이런식으로 선택가능
        downloadJson(MEMBER_LIST_URL)
            .subscribe(onNext: {print($0)})
        downloadJson(MEMBER_LIST_URL)
            .subscribe(onNext: {print($0)}, onCompleted: {print("completed")})
        
        // DispatchQueue.main.async 빼기
        downloadJson(MEMBER_LIST_URL)
            .map { json in json?.count ?? 0 } // 멤버를 수로 바꾸기
            .filter { cnt in cnt > 0 } // 0보다 큰 것만
            .map { "\($0)" } // Int를 String으로 바꾸고
            .observeOn(MainScheduler.instance) // 이거 하면 DispatchQueue 빼기 가능 sugar api
            // 이렇게 데이터를 중간에 바꾸는 sugar를 Operator 라고 함
            .subscribe(onNext: { json in
                self.editView.text = json
                self.setVisibleWithAnimation(self.activityIndicator, false)
            })
    }
}

/**
 RxSwift는 비동기로 생기는 데이터를 completion으로 전달하는게 아니라 return 값으로 전달하고 싶다.
 
 Observable의 생명주기
 
 1. Create
 2. Subscribe // 옵저버블은 subscribe 됐을 때 실행돼
 3. onNext
 -----끝-----
 4. onCompleted / onError
 5. Disposed
 
 create되고 나서 subscribe 되고 onNext로 데이터가 전달되다가 completed 되면서 끝남
 
 한번 끝난 옵저버블은 재사용 못해
 */
