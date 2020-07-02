///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation
import Bond

final class HomeViewModel: HomeViewModelOutputs {
    
    var items: MutableObservableArray2D<String?, CellInterface> = MutableObservableArray2D<String?, CellInterface>(Array2D<String?, CellInterface>())
    
    var homeService: HomeServiceInterface
    private var processingGroup = DispatchGroup()
    
    init(service: HomeServiceInterface) {
        self.homeService = service
    }
}

extension HomeViewModel: HomeViewModelInputs {
    func onViewDidLoad() {
        fetch()
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
        let items: [CellInterface] = []
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
