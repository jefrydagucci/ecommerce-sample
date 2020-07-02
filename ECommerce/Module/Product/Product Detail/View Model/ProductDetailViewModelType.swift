///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation
import ReactiveKit

protocol ProductDetailViewModelType {
    var inputs: ProductDetailViewModelInputs { get }
    var outputs: ProductDetailViewModelOutputs { get }
}

protocol ProductDetailViewModelInputs {
    func onViewDidLoad()
}

protocol ProductDetailViewModelOutputs {
    var titleSignal: Signal<String?, Never> { get }
    var descriptionSignal: Signal<String?, Never> { get }
    var likedSignal: Signal<Bool, Never> { get }
    var priceSignal: Signal<String?, Never> { get }
    var imageURLSignal: Signal<URL, Never> { get }
}
