///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class ProductDetailWireframe {
    func show(product: Product, from: UIViewController) {
        from.navigationController?.pushViewController(
            create(product: product),
            animated: true)
    }
}

extension ProductDetailWireframe {
    func create(product: Product) -> UIViewController {
        let viewModel = ProductDetailViewModel(product: product)
        let vc = ProductDetailViewController(viewModel: viewModel)
        return vc
    }
}
