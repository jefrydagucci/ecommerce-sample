///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var labelTitle: UILabel!
    @IBOutlet weak private var btnLike: UIButton!
    
    private var firstLoad = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureView()
    }
    
//    MARK: configuration
    private func configureView() {
        btnLike.setImage(CoreImageFactory.iconLove?.tint(with: .gray), for: .normal)
        btnLike.setImage(CoreImageFactory.iconLove?.tint(with: .red), for: .selected)
    }
}

extension ProductTableViewCell {
    func bind(viewModel: ProductCellViewModel) -> UITableViewCell {
        labelTitle.text = viewModel.title
        setLike(liked: viewModel.loved)
        setImage(url: viewModel.imageURL)
        return self
    }
}

private extension ProductTableViewCell {
    func setLike(liked: Bool) {
        if !firstLoad {
            let scale = CGAffineTransform(scaleX: 1.5, y: 1.5)
            btnLike.transform = scale
            
            UIView.transition(with: btnLike, duration: 0.5, options: .transitionCrossDissolve, animations: { [weak self]() in
                self?.btnLike.isSelected = liked
                self?.btnLike.transform = .identity
                }, completion: nil)
        } else {
            btnLike.isSelected = liked
            firstLoad = false
        }
    }
    
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
