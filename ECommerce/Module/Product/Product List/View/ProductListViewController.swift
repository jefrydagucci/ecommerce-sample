///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit
import Bond

final class ProductListViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    var viewModel: ProductListViewModelType
    init(viewModel: ProductListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: ProductListViewController.self),
                   bundle: Bundle(for: ProductListViewController.self))
                   title = "Home"
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

private extension ProductListViewController {
    func registerCells() {
        tableView.register(
            UINib(nibName: String(describing: ProductListTableViewCell.self),
                  bundle: Bundle(for: ProductListTableViewCell.self)),
            forCellReuseIdentifier: ProductListTableViewCell.reuseIdentifier)
    }
    
    func configureView() {
        registerCells()
        configureSearchBar()
    }
    
    func configureSearchBar() {
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
    }
}

private extension ProductListViewController {
    func bind() {
        viewModel.outputs.items.bind(to: tableView, using: ProductListBinderDataSource())
        viewModel.outputs.showSearchSignal.bind(to: self) { (vc, show) in
            vc.navigationItem.titleView = show ? vc.searchBar : nil
        }.dispose(in: bag)
        viewModel.outputs.showProductSignal
            .bind(to: self) { (vc, product) in
                vc.hidesBottomBarWhenPushed = true
                ProductDetailWireframe().show(product: product, from: vc)
        }.dispose(in: bag)
        
        tableView.reactive.selectedRowIndexPath.bind(to: self) { (vc, indexPath) in
            vc.viewModel.inputs.onSelect(indexPath: indexPath)
        }.dispose(in: bag)
    }
}

extension ProductListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.inputs.onSearch(text: searchText)
    }
}
