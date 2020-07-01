///**
/**
ContactApp
Created by: Jefry Eko Mulya on 19/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

class Loader {
    
    private static let loaderTag = 190190
    
    struct Component {
        var message: String
    }
    
    class func showFullScreenLoader(
        from: UIViewController,
        component: Component){
        
        showFullScreenLoader(from: from, message: component.message)
    }
    
    class func showFullScreenLoader(
        from: UIViewController,
        message: String){
        
        guard let container = from.view,
            container.viewWithTag(loaderTag) == nil else { return }
        
        let loaderView = DGFullScreenLoaderView(text: message)
        container.addSubview(loaderView)
        loaderView.tag = loaderTag
        
        loaderView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loaderView.topAnchor.constraint(equalTo: container.topAnchor),
            loaderView.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            loaderView.leftAnchor.constraint(equalTo: container.leftAnchor),
            loaderView.rightAnchor.constraint(equalTo: container.rightAnchor)
            ])
    }
    
    class func hideFullScreenLoader(
        from: UIViewController){
        
        from.view?.viewWithTag(loaderTag)?.removeFromSuperview()
    }
}

