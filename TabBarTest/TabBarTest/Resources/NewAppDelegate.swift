//
//  NewAppDelegate.swift
//  TabBarTest
//
//  Created by ✨EUGENE✨ on 2021/11/05.
//

import UIKit
@main
class NewAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            // 탭 바 컨트롤러 생성
            let tbC = UITabBarController()
            tbC.view.backgroundColor = .white
            
            // tbC를 루트 뷰 컨트롤러로 연결
            self.window?.rootViewController = tbC
            
            // 각 탭 바 아이템에 연결된 뷰 컨트롤러 객체를 생성
            let home = HomeVC()
            let search = SearchVC()
            let subscribe = SubscribeVC()
            
            // 생성된 뷰 컨트롤러 객체에게 탭 바 컨트롤러를 등록
            tbC.setViewControllers([home, search, subscribe], animated: false)
            
            // 개별 탭 바 아이템의 속성을 설정
        home.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(systemName: "house"), selectedImage: nil)
        search.tabBarItem = UITabBarItem(title: "File", image: UIImage(systemName: "safari"), selectedImage: nil)
        subscribe.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(systemName: "sparkles.rectangle.stack"), selectedImage: nil)
            
            return true
        }
}
