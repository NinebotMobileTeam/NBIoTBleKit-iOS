//
//  AppDelegate.swift
//  NBIoTBleKitDemoSwift
//
//  Created by yun.ao on 2021/7/7.
//

import UIKit
import NBIoTBleKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        IQKeyboardManager.shared.enable = true
                
        #error("Remove this line after you replaced operator code and secret")
        
        NBIoTBleService.shared().isDebugEnabled = true
        NBIoTBleService.shared().start(withOperatorCode: "<#replace your operator code#>", andSecret: "<#replace your secret code#>") { isSuccess, error in
            if isSuccess {
                print("Register successfully")
            }
            
            if let error = error {
                print("\(error)")
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
//
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

