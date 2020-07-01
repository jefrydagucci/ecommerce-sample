///**
/**
ECommerce
Created by: Jefry Eko Mulya on 01/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class HomeViewController: UIViewController {
    init() {
        super.init(nibName: String.init(describing: HomeViewController.self),
                   bundle: Bundle(for: HomeViewController.self))
        title = "Home"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
