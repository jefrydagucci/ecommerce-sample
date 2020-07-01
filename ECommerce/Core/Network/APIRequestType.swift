///**
/**
ContactApp
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import Alamofire

protocol APIRequestProtocol {
    var url: URLConvertible { get }
    var params: Parameters? { get }
    var method: HTTPMethod { get }
    var headers: HTTPHeaders? { get }
    var encoding: ParameterEncoding { get }
}
