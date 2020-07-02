///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation
import ReactiveKit
import GoogleSignIn

protocol LoginViewModelType {
    var inputs: LoginViewModelInputs { get }
    var outputs: LoginViewModelOutputs { get }
}

protocol LoginViewModelInputs {
    func onConnectGoogle(user: GIDGoogleUser)
}

protocol LoginViewModelOutputs {
    var showHome: Signal<Void, Never> { get }
}
