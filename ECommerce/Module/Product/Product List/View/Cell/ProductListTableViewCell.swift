///**
/**
 ECommerce
 Created by: Jefry Eko Mulya on 02/07/20
 https://github.com/jefrydagucci
 Copyright (c) 2020 DAGUCI
 
 */

import UIKit

class ProductListTableViewCell: UITableViewCell {
    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var labelTitle: UILabel!
    @IBOutlet weak private var labelDetail: UILabel!
}

extension ProductListTableViewCell {
    func bind(viewModel: ProductListCellViewModel) -> UITableViewCell {
        labelTitle.text = viewModel.title
        labelDetail.text = viewModel.detail
        setImage(url: viewModel.imageURL)
        return self
    }
}

private extension ProductListTableViewCell {
    func setImage(url: URL?) {
        if let url = url {
            UIImage.getFrom(url: url) { (image) in
                DispatchQueue.main.async { [weak self] in
                    self?.imgView.image = image
                }
            }
        }
    }
}
