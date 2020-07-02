///**
/**
ECommerce
Created by: Jefry Eko Mulya on 01/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit
import GoogleSignIn

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        GoogleSignManager.shared.setup()
        let mainWindow = UIWindow(frame: UIScreen.main.bounds)
        window = mainWindow
        
        if GoogleSignManager.shared.isLogin() {
            TabBarWireframe().show(in: window)
        } else {
            LoginWireframe().show(in: window)
        }
        window?.makeKeyAndVisible()
        return true
    }

    @available(iOS 9.0, *)
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
      return GIDSignIn.sharedInstance().handle(url)
    }
}

