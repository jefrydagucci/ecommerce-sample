///**
/**
ContactApp
Created by: Jefry Eko Mulya on 19/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

final class DGNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationBar.barTintColor = .white
    }
    
    private var backButton: UIBarButtonItem {
        let button = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        button.tintColor = UIColor.black
        return button
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = backButton
        super.pushViewController(viewController, animated: animated)
    }
}
