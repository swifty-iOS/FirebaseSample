//
//  UIViewController+Alert.swift
//  SampleFirebase
//
//  Created by TCS-Manish on 26/10/2017.
//  Copyright © 2017 Manish. All rights reserved.
//

import UIKit

extension UIViewController {
    
    typealias ActionHandler = ((UIAlertAction) -> Void)
    
    @discardableResult
    func showAlert(title: String?, message: String, completion: ActionHandler? = nil) -> UIAlertController {
        
        let button = UIAlertAction(title: "OK", style: .default, handler: completion)
        return showAlert(title: title, message: message, actions: [button])
    }
    
    @discardableResult
    func showAlert(title: String?, message: String, actions: [UIAlertAction]) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alert.addAction($0) }
        present(alert, animated: true, completion: nil)
        return alert
    }

}
