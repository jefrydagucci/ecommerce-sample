///**
/**
ContactApp
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import Foundation

enum NetworkResult<T: Decodable> {
    case success(model: T)
    case failure(err: NetworkError)
}
