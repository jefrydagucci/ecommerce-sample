///**
/**
ECommerce
Created by: Jefry Eko Mulya on 01/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import UIKit

final class HomeViewController: UIViewController {
    @IBOutlet weak private var tableView: UITableView!
    
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        return searchBar
    }()
    
    var viewModel: HomeViewModelType
    init(viewModel: HomeViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: String(describing: HomeViewController.self),
                   bundle: Bundle(for: HomeViewController.self))
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

private extension HomeViewController {
    func configureView() {
        registerCells()
        configureSearchBar()
    }
    
    func registerCells() {
        tableView.register(
            UINib(nibName: String(describing: ProductTableViewCell.self),
                  bundle: Bundle(for: ProductTableViewCell.self)),
            forCellReuseIdentifier: ProductTableViewCell.reuseIdentifier)

        tableView.register(
            UINib(nibName: String(describing: CategoriesTableViewCell.self),
                  bundle: Bundle(for: CategoriesTableViewCell.self)),
            forCellReuseIdentifier: CategoriesTableViewCell.reuseIdentifier)
    }
    
    func configureSearchBar() {
        self.navigationItem.titleView = searchBar
        searchBar.delegate = self
    }
}

private extension HomeViewController {
    func bind() {
        viewModel.outputs.items.bind(to: tableView, using: HomeViewBinderDataSource())
        viewModel.outputs.showProductsSignal
            .bind(to: self) { (vc, products) in
                ProductListWireframe().show(products: products, from: vc)
                vc.searchBar.endEditing(true)
        }.dispose(in: bag)
        viewModel.outputs.showProductSignal
            .bind(to: self) { (vc, product) in
                vc.hidesBottomBarWhenPushed = true
                ProductDetailWireframe().show(product: product, from: vc)
                vc.hidesBottomBarWhenPushed = false
        }.dispose(in: bag)
        
        tableView.reactive.selectedRowIndexPath.bind(to: self) { (vc, indexPath) in
            vc.viewModel.inputs.onSelect(indexPath: indexPath)
        }.dispose(in: bag)
    }
}

extension HomeViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        viewModel.inputs.onSearchBeginEditing()
    }
}
