///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation

final class HomeService: HomeServiceInterface {
    
    struct EndPoint {
        static let home = "https://private-4639ce-ecommerce56.apiary-mock.com/home"
    }
    
    func get(completion: @escaping (NetworkResult<[ResponseModel<HomeModel>]>) -> Void) {
        let request = HomeRequest(url: EndPoint.home)
        request.perform(completion: completion)
    }
}
