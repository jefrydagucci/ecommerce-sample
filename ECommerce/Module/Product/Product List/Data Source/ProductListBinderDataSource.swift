///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Bond

class ProductListBinderDataSource<Changeset: SectionedDataSourceChangeset>: TableViewBinderDataSource<Changeset> where Changeset.Collection == Array2D<String?, CellInterface> {
    
    override init() {
        super.init()
        self.rowInsertionAnimation = .none
        self.rowDeletionAnimation = .none
        self.rowReloadAnimation = .none
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let changeset = changeset else { return UITableViewCell() }
        let items = changeset.collection
        guard let sections = items.sections[safe: indexPath.section],
            let viewModel = sections.items[safe: indexPath.row] else {
                return UITableViewCell()
        }
        if let viewModel = viewModel as? ProductListCellViewModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: ProductListTableViewCell.reuseIdentifier) as? ProductListTableViewCell {
            return cell.bind(viewModel: viewModel)
        } else {
            return UITableViewCell()
        }
    }
}
