///**
/**
ContactApp
Created by: Jefry Eko Mulya on 17/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

extension UIImage {
    static func getFrom(url: URL, completion: ((_ image: UIImage?) -> Void)?) {
        let task = URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let image = UIImage(data: data)
            completion?(image)
        }
        task.resume()
    }
}
