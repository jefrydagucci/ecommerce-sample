///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation
import GoogleSignIn

final class GoogleSignManager {
    static let shared = GoogleSignManager()
    
    func setup() {
        GIDSignIn.sharedInstance().clientID = "34847459238-f51ouaen1avmd3ujvokk33mh5g84eqi0.apps.googleusercontent.com"
    }
    
    func isLogin() -> Bool {
        return GIDSignIn.sharedInstance()?.currentUser != nil
    }
}
