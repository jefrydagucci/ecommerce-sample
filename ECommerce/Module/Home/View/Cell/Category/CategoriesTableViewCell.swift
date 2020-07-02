///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class CategoriesTableViewCell: UITableViewCell {
    @IBOutlet weak private var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        registerCells()
    }
}

private extension CategoriesTableViewCell {
    func registerCells() {
        collectionView.register(UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: Bundle(for: CategoryCollectionViewCell.self)), forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier)
    }
}

extension CategoriesTableViewCell {
    func bind(viewModel: CategoriesCellViewModel) -> CategoriesTableViewCell {
        
        viewModel.items.bind(to: collectionView, using: CategoriesCollectionBinderDataSource())
        return self
    }
}
