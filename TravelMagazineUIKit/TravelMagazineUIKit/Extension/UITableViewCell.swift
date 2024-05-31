//
//  UITableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/31/24.
//

import UIKit

extension UITableViewCell: ReuseIdentifier {
    static var identifier: String {
        return String(describing: self)
    }
}
