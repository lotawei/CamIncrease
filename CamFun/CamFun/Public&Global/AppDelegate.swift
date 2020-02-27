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
        
//        ToolExceptionHandler.startExceptionCatch()
        //  swift  crash  catch
        swiftCatch()
        // Override point for customization after application launch.
        self.window=UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.rootViewController = MainTabbarViewController()
        self.window?.makeKeyAndVisible()
        
        return true
    }

    // MARK: UISceneSession Lifecycle
    
}

extension  NSException{
    
    func  exceptionlog(){
        
        
        print("***********exceptionname:\(self.name)\nreson:\(self.reason ?? "")\nuserinfo:\(String(describing: self.userInfo))\nstackcall:\(self.callStackReturnAddresses)\nsymbols:\(self.callStackSymbols)**********")
    }
    
}

func Log<N>(_ message: N, fileName: String = #file, methodName: String = #function, lineNumber: Int = #line){
    
    #if DEBUGSWIFT // 若是Debug模式下，则打印
    
    print("\(fileName as NSString)\n方法:\(methodName)\n行号:\(lineNumber)\n打印信息\(message)");
    #endif
}
func   swiftCatch(){
    
    NSSetUncaughtExceptionHandler { exception in

           Log(Thread.callStackSymbols)

       }



       signal(SIGABRT) { _ in

           Log( Thread.callStackSymbols)

       }



       signal(SIGILL) { _ in

           Log( Thread.callStackSymbols)

       }



       signal(SIGSEGV) { _ in

           Log( Thread.callStackSymbols)

       }



       signal(SIGFPE) { _ in

           Log( Thread.callStackSymbols)

       }



       signal(SIGBUS) { _ in

           Log( Thread.callStackSymbols)

       }



       signal(SIGPIPE) { _ in

           Log( Thread.callStackSymbols)

       }


    
}
