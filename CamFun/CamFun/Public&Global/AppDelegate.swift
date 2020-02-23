//
//  AppDelegate.swift
//  CamFun
//
//  Created by 伟龙 on 2020/2/21.
//  Copyright © 2020 伟龙. All rights reserved.
//

import UIKit
import RxSwift
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

     var   window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window=UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainTabbarViewController()
        self.window?.makeKeyAndVisible()
        
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    
}

