///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class LoginWireframe {
    func show(in window: UIWindow?) {
        guard let window = window else { return }
        let vc = create()
        UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve, animations: {
            window.rootViewController = vc
        }, completion: nil)
    }
}

extension LoginWireframe {
    func create() -> UIViewController {
        let vc = LoginViewController(viewModel: LoginViewModel())
        return vc
    }
}
