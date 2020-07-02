///**
/**
ECommerce
Created by: Jefry Eko Mulya on 02/07/20
https://github.com/jefrydagucci
Copyright (c) 2020 DAGUCI

*/

import Foundation

struct Product: Decodable {
    var id: String
    var imageUrl: URL?
    var title: String?
    var description: String?
    var price: String?
    var loved: Int
    
    var isLoved: Bool {
        return loved != 0
    }
}
