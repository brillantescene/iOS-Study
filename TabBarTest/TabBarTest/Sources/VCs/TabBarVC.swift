//
//  TabBarVC.swift
//  TabBarTest
//
//  Created by ✨EUGENE✨ on 2020/11/20.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabBar()
        // Do any additional setup after loading the view.
    }
    
    func setTabBar() {
        self.tabBar.tintColor = UIColor.black
        
        // Home
        let Home = UIStoryboard.init(name: "Home", bundle: nil)
        guard let firstTab = Home.instantiateViewController(identifier: "HomeVC") as? HomeVC else {
            return
        }
        
        firstTab.tabBarItem.title = "홈"
        firstTab.tabBarItem.image = UIImage(systemName: "house")
        firstTab.tabBarItem.selectedImage = UIImage(systemName: "house.fill")
        
        // Search
        let Search = UIStoryboard.init(name: "Search", bundle:nil)
        guard let secondTab = Search.instantiateViewController(identifier: "SearchVC") as? SearchVC else {
            return
        }
        
        secondTab.tabBarItem.title = "탐색"
        secondTab.tabBarItem.image = UIImage(systemName: "safari")
        secondTab.tabBarItem.selectedImage = UIImage(systemName: "safari.fill")
    
        // Subscribe
        let Subscribe = UIStoryboard.init(name: "Subscribe", bundle: nil)
        guard let thirdTab = Subscribe.instantiateViewController(identifier: "SubscribeVC") as? SubscribeVC else {
            return
        }
        
        thirdTab.tabBarItem.title = "구독"
        thirdTab.tabBarItem.image = UIImage(systemName: "sparkles.rectangle.stack")
        thirdTab.tabBarItem.selectedImage = UIImage(systemName: "sparkles.rectangle.stack.fill")
        
        
        // Notification
        let Noti = UIStoryboard.init(name: "Noti", bundle: nil)
        guard let fourthTab = Noti.instantiateViewController(identifier: "NotiVC") as? NotiVC else {
            return
        }
        
        fourthTab.tabBarItem.title = "알림"
        fourthTab.tabBarItem.image = UIImage(systemName: "bell")
        fourthTab.tabBarItem.selectedImage = UIImage(systemName: "bell.fill")
        
        // Storage
        let Storage = UIStoryboard.init(name: "Storage", bundle: nil)
        guard let fifthTab = Storage.instantiateViewController(identifier: "StorageVC") as? StorageVC else {
            return
        }
        
        fifthTab.tabBarItem.title = "보관함"
        fifthTab.tabBarItem.image = UIImage(systemName: "play.rectangle")
        fifthTab.tabBarItem.selectedImage = UIImage(systemName: "play.rectangle.fill")
        
        let tabs =  [firstTab, secondTab, thirdTab, fourthTab, fifthTab]
        
        self.setViewControllers(tabs, animated: false)
    }
}
