//
//  TravelMagazineTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

class TravelMagazineTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        titleLabel.textColor = .black
        subtitleLabel.textColor = .black
        dateLabel.textColor = .black
        
        titleLabel.textAlignment = .left
        subtitleLabel.textAlignment = .left
        dateLabel.textAlignment = .right
        
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        subtitleLabel.font = .systemFont(ofSize: 13, weight: .regular)
        dateLabel.font = .systemFont(ofSize: 13, weight: .regular)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        travelImageView.image = nil
        titleLabel.text = ""
        subtitleLabel.text = ""
        dateLabel.text = ""
    }
    
    func configureLabel(
        label: UILabel,
        text: String
    ) {
        label.numberOfLines = .zero
        label.text = text
    }
    
}
