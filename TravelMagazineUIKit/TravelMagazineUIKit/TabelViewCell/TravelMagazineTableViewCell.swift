//
//  TravelMagazineTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo Ham on 5/26/24.
//

import UIKit

import Kingfisher

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
    
    func configureCell(magazineInfo: Magazine) {
        configureLabel(
            label: titleLabel,
            text: magazineInfo.title
        )
        
        configureLabel(
            label: subtitleLabel,
            text: magazineInfo.subtitle
        )
        
        configureLabel(
            label: dateLabel,
            text: magazineInfo.stringToFormattedDate
        )
        
        travelImageView.kf.setImage(with: magazineInfo.linkToURL)
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 10
    }
    
}
