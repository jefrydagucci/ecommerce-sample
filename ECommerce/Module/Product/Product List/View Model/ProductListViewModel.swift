///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation
import Bond
import ReactiveKit

final class ProductListViewModel: ProductListViewModelOutputs {
    
    var items: MutableObservableArray2D<String?, CellInterface> = MutableObservableArray2D<String?, CellInterface>(Array2D<String?, CellInterface>())
    
    var showSearchSignal: Signal<Bool, Never> {
        return showSearchSubject.toSignal()
    }
    var showProductSignal: Signal<Product, Never> {
        return showProductSubject.toSignal()
    }
    
    private var products: [Product]
    private var showSearchSubject = Subject<Bool, Never>()
    private var showProductSubject = Subject<Product, Never>()
    private var keyword: String = ""
    
    init(products: [Product]) {
        self.products = products
    }
}

extension ProductListViewModel: ProductListViewModelInputs {
    func onViewDidLoad() {
        showSearchSubject.send(true)
        setupItems(products: filtering(products: products, keyword: ""))
    }
    
    func onSearch(text: String) {
        keyword = text
        setupItems(products: filtering(products: products, keyword: text))
    }
    
    func onSelect(indexPath: IndexPath) {
        let filtered = filtering(products: products, keyword: keyword)
        guard let product = filtered[safe: indexPath.row] else { return }
        showProductSubject.send(product)
    }
}

extension ProductListViewModel: ProductListViewModelType {
    var inputs: ProductListViewModelInputs {
        return self
    }
    
    var outputs: ProductListViewModelOutputs {
        return self
    }
}

private extension ProductListViewModel {
    
    func filtering(products: [Product], keyword: String) -> [Product] {
        
        guard !keyword.isEmpty else { return products }
        
        let filtered = products.filter { (product) -> Bool in
            guard let title = product.title else { return false }
            return title.lowercased().contains(keyword.lowercased())
        }
        return filtered
    }
    
    func setupItems(products: [Product]) {
        items.removeAll()
        items.batchUpdate { (editedItems) in
            editedItems.appendSection(sectionProduct(products: products))
        }
    }
    
    func sectionProduct(products: [Product]) -> Array2D<String?, CellInterface>.Section {
        
        let productItems = products.map({
            return ProductListCellViewModel(
                title: $0.title,
                detail: $0.price,
                imageURL:  $0.imageUrl)
        })
        let items: [CellInterface] = productItems
        let section = Array2D<String?, CellInterface>.Section(
            metadata: nil,
            items: items)
        return section
    }
}
