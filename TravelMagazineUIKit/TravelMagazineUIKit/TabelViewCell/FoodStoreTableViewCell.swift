//
//  FoodStoreTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

class FoodStoreTableViewCell: UITableViewCell {

    static let identifier: String = "FoodStoreTableViewCell"
    
    @IBOutlet var storeImageView: UIImageView!
    @IBOutlet var storeNameLabel: UILabel!
    @IBOutlet var storeAddressLabel: UILabel!
    @IBOutlet var storeNumberLabel: UILabel!
    @IBOutlet var foodCategoryLabel: UILabel!
    @IBOutlet var favoriteButton: UIButton!
    
    
    func configureLabel(
        label: UILabel,
        text: String,
        textColor: UIColor,
        textAlignment: NSTextAlignment,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight
    ) {
        label.numberOfLines = .zero
        
        label.text = text
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.font = .systemFont(
            ofSize: fontSize,
            weight: fontWeight
        )
    }
    
    
}
