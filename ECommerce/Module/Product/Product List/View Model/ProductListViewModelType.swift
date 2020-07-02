///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Bond
import ReactiveKit

protocol ProductListViewModelType {
    var inputs: ProductListViewModelInputs { get }
    var outputs: ProductListViewModelOutputs { get }
}

protocol ProductListViewModelInputs {
    func onViewDidLoad()
    func onSearch(text: String)
}

protocol ProductListViewModelOutputs {
    var items: MutableObservableArray2D<String?, CellInterface> { get }
    var showSearchSignal: Signal<Bool, Never> { get }
}
