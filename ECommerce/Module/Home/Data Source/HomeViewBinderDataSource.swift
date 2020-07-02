///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Bond

class HomeViewBinderDataSource<Changeset: SectionedDataSourceChangeset>: TableViewBinderDataSource<Changeset> where Changeset.Collection == Array2D<String?, CellInterface> {
    
    override init() {
        super.init()
        self.rowInsertionAnimation = .fade
        self.rowDeletionAnimation = .fade
        self.rowReloadAnimation = .fade
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let changeset = changeset else { return UITableViewCell() }
        let items = changeset.collection
        guard let sections = items.sections[safe: indexPath.section],
            let viewModel = sections.items[safe: indexPath.row] else {
                return UITableViewCell()
        }
        if let viewModel = viewModel as? ProductCellViewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductTableViewCell.reuseIdentifier) as? ProductTableViewCell {
            return cell.bind(viewModel: viewModel)
        } else if let viewModel = viewModel as? CategoriesCellViewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: CategoriesTableViewCell.reuseIdentifier) as? CategoriesTableViewCell {
            return cell.bind(viewModel: viewModel)
        } else {
            return UITableViewCell()
        }
    }
}
