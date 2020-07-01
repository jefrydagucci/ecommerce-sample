///**
/**
ContactApp
Created by: Jefry Eko Mulya on 18/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

extension UIView {
    class func fromNib<T: UIView>() -> T? {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)?.first as? T
    }
}
