///**
/**
Laundrian
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

class TabBarWireframe {
    func show(in window: UIWindow?) {
        guard let window = window else { return }
        let vc = create()
        UIView.transition(with: window, duration: 1, options: .transitionCrossDissolve, animations: {
            window.rootViewController = vc
        }, completion: nil)
    }
}

extension TabBarWireframe {
    func create() -> UIViewController {
        let vc = TabBarController()
        return vc
    }
}
