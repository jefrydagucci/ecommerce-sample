///**
/**
 ECommerce
 Created by: Jefry Eko Mulya on 02/07/20
 https://github.com/jefrydagucci
 Copyright (c) 2020 DAGUCI
 
 */

import UIKit

final class ProductDetailViewController: UIViewController {
    @IBOutlet weak private var imgView: UIImageView!
    @IBOutlet weak private var btnLike: UIButton!
    @IBOutlet weak private var labelTitle: UILabel!
    @IBOutlet weak private var labelDescription: UILabel!
    @IBOutlet weak private var labelPrice: UILabel!
    
    private var viewModel: ProductDetailViewModelType
    init(viewModel: ProductDetailViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: ProductDetailViewController.self),
                   bundle: Bundle(for: ProductDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        bind()
        viewModel.inputs.onViewDidLoad()
    }
}

private extension ProductDetailViewController {
    func configureView() {
        btnLike.setImage(CoreImageFactory.iconLove?.tint(with: .red), for: .selected)
        btnLike.setImage(CoreImageFactory.iconLove?.tint(with: .gray), for: .normal)
    }
    
    func bind() {
        viewModel.outputs.titleSignal
            .bind(to: labelTitle.reactive.text)
        viewModel.outputs.descriptionSignal
            .bind(to: labelDescription.reactive.text)
        viewModel.outputs.priceSignal
            .bind(to: labelPrice.reactive.text)
        viewModel.outputs.imageURLSignal
            .bind(to: self) { (vc, value) in
                UIImage.getFrom(url: value) { [weak self](image) in
                    self?.imgView.image = image
                }
        }.dispose(in: bag)
        viewModel.outputs.likedSignal
            .bind(to: self) {(vc, value) in
                vc.btnLike.isSelected = value
        }.dispose(in: bag)
    }
}
