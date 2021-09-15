//
//  AppDelegate.swift
//  SwiftStudy
//
//  Created by ✨EUGENE✨ on 2021/05/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//        - 앱이 처음 시작될 때, 사용자에게 화면으로 표시되기 직전에 호출됨
//        - delegate에게 실행 프로세스가 거의 완료되었고, 앱 실행 준비가 거의 완료됐다고 알려줌
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
//        - 앱이 inactive에서 active 상태가 되었다고 delegate에게 알려줌
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
//        - delegate에게 앱이 active에서 inactive가 된다고 알려줌
//        - 이 메서드가 실행되고 나면 UIKit은 관심있는 객체가 상태 변화에 응답할 수 있는 기회를 주기 위해 willResignActiveNotification 메서드를 post함.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
//        - 앱이 지금 background라고 알려줌
//        - 앱이 background 상태일 때 실행됨. 언제는 suspended 상태가 될 수 있음
//        - 이 메서드를 사용해서 공유 리소스 해제, 타이머를 무효화함.
//        - 앱이 나중에 종료될 경우에 대비하여 앱을 현재 상태로 복원하기에 충분한 앱 상태 정보를 저장
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
//        - 앱이 background에서 foreground로 바뀔 때 실행됨
//        - 이 메서드가 실행되면 applicationDidBecomeActive(_:) 메서드도 따라 실행되어 inactive → active로 상태가 변경됨
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
//        - 앱이 종료될 때 실행됨
//        - 백그라운드 실행을 지원하지 않거나 iOS 3.x 이전 버전과 연결된 앱의 경우 이 메서드는 사용자가 앱을 종료할 때 항상 호출됨. 아니면 단순히 백그라운드로 이동함
//        - 앱이 background에서 실행되고 있을 때 앱을 종료해야 하는 상황에서 호출됨 (suspended 상태에서 종료될 때에는 호출되지 않음 !)
    }
    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

