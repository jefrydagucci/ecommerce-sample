///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation

protocol HomeServiceInterface {
    func get(completion: @escaping (NetworkResult<[ResponseModel<HomeModel>]>) -> Void)
}
