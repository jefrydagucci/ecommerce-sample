///**
/**
ContactApp
Created by: Jefry Eko Mulya on 19/11/19
https://github.com/jefrydagucci
Copyright (c) 2019 DAGUCI

*/

import UIKit

class PopupDialog {
    
    struct Action {
        var title: String
        var handler: (() -> Void)?
    }
    
    struct Component {
        var title: String
        var message: String
    }
    
    class func show(from: UIViewController,
                    component: Component,
                    actions: PopupDialog.Action...){
        
        let alertActions = actions.map { (action) -> UIAlertAction in
            let alertAction = UIAlertAction(
                title: action.title,
                style: .default,
                handler: { (uiAlertAction) in
                    action.handler?()
            })
            return alertAction
        }
        let alert = UIAlertController(title: component.title,
                                      message: component.message,
                                      preferredStyle: .alert)
        alertActions.forEach{ alert.addAction($0) }
        from.present(alert, animated: true, completion: nil)
    }
}
