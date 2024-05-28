//
//  CityDetailTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/27/24.
//

import UIKit

import Kingfisher

class CityDetailTableViewCell: UITableViewCell {
    
    static let identifier: String = "CityDetailTableViewCell"

    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var gradeLabel: UILabel!
    @IBOutlet var favBtn: UIButton!
    @IBOutlet var mainImgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureUI()
    }
    
    func configureUI() {
        cityNameLabel.font = .systemFont(
            ofSize: 17,
            weight: .bold
        )
        cityNameLabel.textAlignment = .left
        descriptionLabel.font = .systemFont(
            ofSize: 15,
            weight: .regular
        )
        descriptionLabel.textColor = .darkGray
        descriptionLabel.textAlignment = .left
        gradeLabel.textColor = .lightGray
        gradeLabel.font = .systemFont(
            ofSize: 13,
            weight: .medium
        )
        gradeLabel.textAlignment = .left
        
        mainImgView.contentMode = .scaleAspectFill
        mainImgView.layer.cornerRadius = 10
        
        favBtn.setTitle("", for: .normal)
        favBtn.tintColor = UIColor.purple
    }
    
    func configureData(data: Travel, tag: Int) {
        cityNameLabel.text = data.title
        descriptionLabel.text = data.description
        
        guard let grade = data.grade,
              let save = data.save else { return }
        
        gradeLabel.text = "(\(grade)) · 저장 " + save.formatted()
        
        guard let imgUrl = data.travel_image else { return }
        let url = URL(string: imgUrl)
        mainImgView.kf.setImage(
            with: url,
            placeholder: UIImage(systemName: "star")
        )
        
        favBtn.tag = tag
        favBtn.setImage(
            UIImage(systemName: data.like! ? "heart.fill" : "heart"),
            for: .normal
        )
    }
    
}
