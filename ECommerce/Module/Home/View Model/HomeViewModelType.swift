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

protocol HomeViewModelType {
    var inputs: HomeViewModelInputs { get }
    var outputs: HomeViewModelOutputs { get }
}

protocol HomeViewModelInputs {
    func onViewDidLoad()
    func onSearchBeginEditing()
    func onSelect(indexPath: IndexPath)
}

protocol HomeViewModelOutputs: class {
    var items: MutableObservableArray2D<String?, CellInterface> { get }
    var showProductsSignal: Signal<[Product], Never> { get }
    var showProductSignal: Signal<Product, Never> { get }
}
