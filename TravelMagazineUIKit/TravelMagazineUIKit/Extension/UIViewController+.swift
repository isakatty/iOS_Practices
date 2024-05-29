//
//  UIViewController+.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/28/24.
//

import UIKit

extension UIViewController {
    func configureBaseView(
        _ titleString: String
    ) {
        navigationItem.title = titleString
    }
    
    func hideKeyboard() {
        let tap = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard)
        )
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
