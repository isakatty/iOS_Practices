//
//  UIViewController+.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

extension UIViewController: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
    
    func hideKeyboard() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(self.dismissKeyboard)
        )
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
