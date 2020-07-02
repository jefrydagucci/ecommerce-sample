///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation
import ReactiveKit

final class ProductDetailViewModel: ProductDetailViewModelOutputs {
    var titleSignal: Signal<String?, Never> {
        return titleSubject.toSignal()
    }
    
    var descriptionSignal: Signal<String?, Never> {
        return descriptionSubject.toSignal()
    }
    
    var likedSignal: Signal<Bool, Never> {
        return likedSubject.toSignal()
    }
    
    var priceSignal: Signal<String?, Never> {
        return priceSubject.toSignal()
    }
    
    var imageURLSignal: Signal<URL, Never> {
        return imageURLSubject.toSignal()
    }
    
    private var titleSubject = Subject<String?, Never>()
    private var descriptionSubject = Subject<String?, Never>()
    private var likedSubject = Subject<Bool, Never>()
    private var priceSubject = Subject<String?, Never>()
    private var imageURLSubject = Subject<URL, Never>()
    
    private var product: Product
    init(product: Product) {
        self.product = product
    }
}

extension ProductDetailViewModel: ProductDetailViewModelInputs {
    func onViewDidLoad() {
        configure(with: product)
    }
}

extension ProductDetailViewModel: ProductDetailViewModelType {
    var inputs: ProductDetailViewModelInputs {
        return self
    }
    
    var outputs: ProductDetailViewModelOutputs {
        return self
    }
}

private extension ProductDetailViewModel {
    func configure(with product: Product) {
        titleSubject.send(product.title)
        descriptionSubject.send(product.description)
        likedSubject.send(product.isLoved)
        priceSubject.send(product.price)
        if let url = product.imageUrl {
            imageURLSubject.send(url)
        }
    }
}

