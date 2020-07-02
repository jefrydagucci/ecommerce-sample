///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var labelTitle: UILabel!
    
    lazy var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}

extension CategoryCollectionViewCell {
    func bind(viewModel: CategoryCellViewModel) -> UICollectionViewCell {
        setImage(url: viewModel.imageURL)
        labelTitle.text = viewModel.title
        return self
    }
}

private extension CategoryCollectionViewCell {
    
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
