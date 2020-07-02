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

final class LoginViewModel: LoginViewModelOutputs {
    private var showHomeSubject = Subject<Void, Never>()
    var showHome: Signal<Void, Never> {
        return showHomeSubject.toSignal()
    }
}

extension LoginViewModel: LoginViewModelInputs {
    func onConnectGoogle(user: GIDGoogleUser) {
        showHomeSubject.send()
    }
}

extension LoginViewModel: LoginViewModelType {
    var inputs: LoginViewModelInputs {
        return self
    }
    
    var outputs: LoginViewModelOutputs {
        return self
    }
}
