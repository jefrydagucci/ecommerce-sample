///**
/**
ContactApp
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import Alamofire

struct NetworkError: Error, Decodable {
    let status: String
    let error: String
    
    enum ErrorType {
        case noResult
        case noInternetConnection
        case timeout
        case cannotFindHost
        case unknown
    }
    
    var type: ErrorType {
        switch Int(status) {
        case 404:
            return .noResult
        case NSURLErrorNotConnectedToInternet:
            return .noInternetConnection
        case NSURLErrorTimedOut:
            return .timeout
        default:
            return .unknown
        }
    }
}


