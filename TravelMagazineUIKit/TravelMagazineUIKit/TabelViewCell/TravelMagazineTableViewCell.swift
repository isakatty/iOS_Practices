//
//  TravelMagazineTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

class TravelMagazineTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet var travleImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    
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
