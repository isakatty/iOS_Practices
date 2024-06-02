//
//  UITableViewCell+.swift
//  TravelTalk
//
//  Created by Jisoo HAM on 6/1/24.
//

import UIKit

extension UITableViewCell: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
