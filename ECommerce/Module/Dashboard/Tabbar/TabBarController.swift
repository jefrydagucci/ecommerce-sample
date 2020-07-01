///**
/**
Laundrian
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

enum TabType {
    case home
}

final class TabBarController: UITabBarController {
    
    init() {
        super.init(nibName: "TabBarController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var homeVC: UINavigationController = {
        let vc = HomeViewController()
        vc.tabBarItem = UITabBarItem(title: vc.title, image: nil, selectedImage: nil)
        let navigationController = DGNavigationController(rootViewController: vc)
        return navigationController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setControllers()
        configureView()
    }
    
    private func configureView() {
        self.tabBar.barTintColor = UIColor.white
    }
    
    private func setControllers() {
        setViewControllers([homeVC], animated: false)
    }

}

extension TabBarController {
    
    @discardableResult
    func select(tabType: TabType) -> UINavigationController? {
        var navigation: UINavigationController?
        switch tabType {
        case .home:
            navigation = homeVC
        }
        selectedViewController = navigation
        return navigation
    }
}
