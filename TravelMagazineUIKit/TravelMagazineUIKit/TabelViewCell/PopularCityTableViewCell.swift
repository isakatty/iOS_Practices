//
//  PopularCityTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/29/24.
//

import UIKit

/* TODO: 인기도시 TableView Cell 구성
 UIView - imgView + label 2개
    - UIView: 좌측 상단, 우측 하단 코너 값 주기
           ✅ clipToBounds = true / cornerRadius 값 /
              maskedCorners - CACornerMask <min,max X,Y>
              shadow
    - citySpotLabel: background color, text 흰색, font size, weight 고정
    - nameLabel: City의 name/eng_name 연산프로퍼티
 */

class PopularCityTableViewCell: UITableViewCell {
    
    // MARK: - properties
    @IBOutlet var bgView: UIView!
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var citySpotLabel: UILabel!
    
    // 변하지 않는 형태 미리 구성하는 함수
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        bgView.clipsToBounds = true
        bgView.layer.cornerRadius = 20
        bgView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMaxYCorner)
        
        cityImageView.contentMode = .scaleAspectFill
        
        configureLabel(label: cityNameLabel, align: .center, color: .white, fontSize: 17, fontWeight: .bold)
        configureLabel(label: citySpotLabel, align: .left, color: .white, fontSize: 14, fontWeight: .medium)
        citySpotLabel.backgroundColor = .black
        citySpotLabel.backgroundColor?.withAlphaComponent(0.3)
        cityNameLabel.backgroundColor = .clear
        
    }
    
    // 재사용시 cell component 새로 구성
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cityImageView.image = nil
        cityNameLabel.text = ""
        citySpotLabel.text = ""
    }
    
    private func configureLabel(
        label: UILabel,
        align: NSTextAlignment,
        color: UIColor,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight
    ) {
        label.textAlignment = align
        label.textColor = color
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
    }
    
    /* 접근제어
     internal: 기본값, 생략 가능
     private: 선언된 파일 내부에서만 사용 가능
     public: 모듈 상관 없이 사용 가능
     */
    internal func configureCell(city: City) {
        cityImageView.kf.setImage(
            with: city.imageURL,
            placeholder: UIImage(systemName: "heart")
        )
        cityNameLabel.text = city.dualLangCityName
        citySpotLabel.text = city.city_explain
    }
    
}
