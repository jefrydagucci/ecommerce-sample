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

final class HomeViewModel: HomeViewModelOutputs {
    
    var items: MutableObservableArray2D<String?, CellInterface> = MutableObservableArray2D<String?, CellInterface>(Array2D<String?, CellInterface>())
    var showProductsSignal: Signal<[Product], Never> {
        return showProductsSubject.toSignal()
    }
    
    var showProductSignal: Signal<Product, Never> {
        return showProductSubject.toSignal()
    }
    
    var homeService: HomeServiceInterface
    private var showProductsSubject = Subject<[Product], Never>()
    private var showProductSubject = Subject<Product, Never>()
    private var processingGroup = DispatchGroup()
    private var homeModel: HomeModel?
    private var products: [Product] {
        return homeModel?.productPromo ?? []
    }
    
    init(service: HomeServiceInterface) {
        self.homeService = service
    }
}

extension HomeViewModel: HomeViewModelInputs {
    
    func onViewDidLoad() {
        fetch()
    }
    
    func onSearchBeginEditing() {
        showProductsSubject.send(products)
    }
    
    func onSelect(indexPath: IndexPath) {
        if let product = homeModel?.productPromo[safe: indexPath.row] {
            showProductSubject.send(product)
        }
    }
}

extension HomeViewModel: HomeViewModelType {
    var inputs: HomeViewModelInputs {
        return self
    }
    
    var outputs: HomeViewModelOutputs {
        return self
    }
}

private extension HomeViewModel {
    func fetch() {
        var homeModel: HomeModel?
        
        processingGroup.enter()
        homeService.get { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let responseModel):
                homeModel = responseModel.first?.data
                self.homeModel = homeModel
            case .failure:
                #warning("unhandled error")
            }
            self.processingGroup.leave()
        }
        processingGroup.notify(queue: .main) { [weak self] in
            self?.setupItems(homeModel: homeModel)
        }
    }
    
    func setupItems(homeModel: HomeModel?) {
        items.removeAll()
        items.batchUpdate { (editedItems) in
            editedItems.appendSection(sectionCategory(categories: homeModel?.category ?? []))
            editedItems.appendSection(sectionProductPromo(products: homeModel?.productPromo ?? []))
        }
    }
}

extension HomeViewModel {
    func sectionCategory(categories: [Category]) -> Array2D<String?, CellInterface>.Section {
        
        let categoryItems = categories.map({
            return CategoryCellViewModel(
                title: $0.name,
                imageURL:  $0.imageUrl)
        })
        let categoryItemsSection = Array2D<String?, CellInterface>.Section(
            metadata: nil,
            items: categoryItems)
        let categoryCellItems =  MutableObservableArray2D<String?, CellInterface>(Array2D<String?, CellInterface>(sections: [
            categoryItemsSection
        ]))
        let categoriesItems = CategoriesCellViewModel(items: categoryCellItems)
        let items: [CellInterface] = [categoriesItems]
        let section = Array2D<String?, CellInterface>.Section(
            metadata: nil,
            items: items)
        
        return section
    }
    
    func sectionProductPromo(products: [Product]) -> Array2D<String?, CellInterface>.Section {
        
        let productItems = products.map({
            return ProductCellViewModel(
                title: $0.title,
                imageURL:  $0.imageUrl,
                loved:  $0.isLoved)
        })
        let items: [CellInterface] = productItems
        let section = Array2D<String?, CellInterface>.Section(
            metadata: nil,
            items: items)
        return section
    }
}
