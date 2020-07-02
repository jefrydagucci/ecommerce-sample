///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Bond

class CategoriesCollectionBinderDataSource<Changeset: SectionedDataSourceChangeset>: CollectionViewBinderDataSource<Changeset>, UICollectionViewDelegateFlowLayout where Changeset.Collection == Array2D<String?, CellInterface> {
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let changeset = changeset,
            let section = changeset.collection.sections[safe: indexPath.section],
            let viewModel = section.items[safe: indexPath.row]
            else { return UICollectionViewCell() }
        
        if let viewModel = viewModel as? CategoryCellViewModel,
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseIdentifier, for: indexPath) as? CategoryCollectionViewCell {
            return cell.bind(viewModel: viewModel)
        } else {
            return UICollectionViewCell()
        }
    }
}


