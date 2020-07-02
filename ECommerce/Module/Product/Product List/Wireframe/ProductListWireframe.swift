///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class ProductListWireframe {
    func show(products: [Product], from: UIViewController) {
        from.hidesBottomBarWhenPushed = true
        from.navigationController?.pushViewController(
            create(products: products),
            animated: true)
        from.hidesBottomBarWhenPushed = false
    }
}

extension ProductListWireframe {
    func create(products: [Product]) -> UIViewController {
        let viewModel = ProductListViewModel(products: products)
        let vc = ProductListViewController(viewModel: viewModel)
        return vc
    }
}
