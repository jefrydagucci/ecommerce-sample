///**
/**
ContactApp
Created by: Jefry Eko Mulya on 17/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import Foundation

extension Collection {
    
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
