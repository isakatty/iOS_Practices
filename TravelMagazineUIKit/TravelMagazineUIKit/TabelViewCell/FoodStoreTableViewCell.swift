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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        storeImageView.contentMode = .scaleToFill
        storeImageView.layer.cornerRadius = 10
        storeImageView.layer.borderWidth = 3
        storeImageView.layer.borderColor = UIColor.black.cgColor
        
        
        storeNameLabel.textColor = .black
        storeAddressLabel.textColor = .darkGray
        storeNumberLabel.textColor = .darkGray
        foodCategoryLabel.textColor = .darkGray
        
        storeNameLabel.textAlignment = .left
        storeAddressLabel.textAlignment = .left
        storeNumberLabel.textAlignment = .left
        foodCategoryLabel.textAlignment = .right
        
        
        storeNameLabel.font = .systemFont(ofSize: 17, weight: .bold)
        storeAddressLabel.font = .systemFont(ofSize: 14, weight: .regular)
        storeNumberLabel.font = .systemFont(ofSize: 14, weight: .regular)
        foodCategoryLabel.font = .systemFont(ofSize: 14, weight: .regular)
        
        favoriteButton.setTitle(
            "",
            for: .normal
        )
    }
    
    
    func configureLabel(
        label: UILabel,
        text: String
    ) {
        label.numberOfLines = .zero
        
        label.text = text
    }
    
    
}
