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
        registerCells()
        bind()
        viewModel.inputs.onViewDidLoad()
    }
}

private extension HomeViewController {
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
}

private extension HomeViewController {
    func bind() {
        viewModel.outputs.items.bind(to: tableView, using: HomeViewBinderDataSource())
    }
}

