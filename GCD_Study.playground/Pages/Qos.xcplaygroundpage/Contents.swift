//: [Previous](@previous)

import Foundation

/*:
 # GCD(디스패치큐)의 종류와 특성
 
 디스패치큐는 세가지 종류로 나뉨
 (글로벌)메인큐, 글로벌큐, 프라이빗큐(커스텀)
 
 대기열마다 특성이 조금씩 달라서 작업 특성, 원하는 일처리에 따라 대기열을 선택해주면 됨.
 
 ## 1. (글로벌) 메인 큐
 - DispatchQueue.main
 - 유일한 큐. 직렬이고, 메인스레드임
 - 메인 스레드면서 메인 큐이기도 함
 
 함 보자면
 */

//: 이런 코드가
print("print something")

//: 사실은 이런 뜻이었다, 이런거지. 근데 이렇게 실행하면 에러 남.
DispatchQueue.main.sync {
    print("print something")
}


//: ## 2. 글로벌 큐
DispatchQueue.global().async {
    // ...
}
/*:
 - 기본 설정은 concurrent임
 - 6종류가 있음. Qos(Quality of Service)로 설정함
 
 왜 종류를 나눠놨을까?
 
 앱과 operation은 CPU, 메모리, 네트워크 인터페이스 등의 유하한 리소스를 사용하기 위해 경쟁함. 반응성과 효율성을 유지하기 위해 시스템은 task의 우선순위를 정하고 언제 실행할지 지능적으로 결정해야 함.
 UI업데이트같이 사용자에게 직접 영향을 주는 작업은 매우 중요하고, 다른 작업보다 우선시 함. 우선순위가 높은 작업은 시스템 리소스에 대해 즉각적이고 실질적인 액세스가 필요할 수 있어서 더 많은 에너지가 필요함.
 개발자는 중요도에 따라 앱의 작업을 분류하여 시스템이 효과적으로 우선순위를 지정하도록 돕는거임.
 QoS를 할당하면 해당 중요도를 표시하고, 시스템이 그 QoS의 우선순위를 지정해서 적절하게 스케쥴링함. 어떤 경우에는 우선순위가 낮은 작업에서 시스템 자원을 재할당하고, 우선순위가 높은 작업에 할당하기도 하고 그럼.
 우선순위가 높은 작업은 낮은 작업보다 더 빨리 수행되고 리소스가 많으므로 더 많은 에너지가 필요함. 앱이 수행하는 작업에 대해 적절한 Qos를 지정하면 앱의 에너지 효율성과 반응성 보장 가능.
 
 iOS가 알아서 우선적으로 중요한 일임을 인지하고 스레드에 우선순위를 매겨 더 여러 개의 스레드를 배치. 배터리를 더 집중해서 사용하도록 함
 
 */
 DispatchQueue.global(qos: .userInteractive)
 // 유저와 직접적인 인터렉티브: UI업데이트, 애니메이션, UI반응관련 등
 // 사용자와 직접 상호작용하는 작업에 권장. 작업이 빨리 처리되지 않으면 상황이 멈춘 것 처럼 보일만한 일
 // 소요시간: 거의 즉시
 DispatchQueue.global(qos: .userInitiated)
 // 유저가 즉시 필요하긴 하지만 비동기적으로 처리된 작업
 // 앱 내에서 pdf 파일 열기, 로컬 데이터베이스 읽기 같은 것
 // 몇 초
 DispatchQueue.global()
 // 일반적인 작업
 DispatchQueue.global(qos: .utility)
 // 보통 progresss indicator와 함께 길게 실행되는 작업, 계산,
 // IO, Networking, 지속적인 데이터 feeds
 // 몇 초에서 몇 분
 DispatchQueue.global(qos: .background)
 // 유저가 직접저으로 인지하지 않고 시간이 안 중요한 작업, 데이터 미리 가져오기, 데베 유지
 // 속도보다는 에너지 효율성 중시. 몇 분 이상
 DispatchQueue.global(qos: .unspecified)
 // 스레드를 서비스 품질에서 제외시키는 legacy API
 // 공식문서에 사용하지 말라 어쩌고

/*:
 ## 3. 프라이빗 큐
 - 커스텀
 - defult는 직렬임. concurrent 설정 가능
 - 
 
 */

//: [Next](@next)
