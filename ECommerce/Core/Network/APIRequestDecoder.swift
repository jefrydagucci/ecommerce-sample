///**
/**
ContactApp
Created by: Jefry Eko Mulya on 01/07/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import Foundation

protocol APIRequestResponseDecoder {
    var decoder: JSONDecoder { get }
}

extension APIRequestResponseDecoder {
    var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }
}
