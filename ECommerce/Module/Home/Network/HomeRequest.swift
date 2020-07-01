///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Alamofire

final class HomeRequest: APIRequest {
    
    init(url: String) {
        super.init(url: url, method: .get, encoding: JSONEncoding())
    }
    
}

