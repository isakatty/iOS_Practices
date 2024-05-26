//
//  ShoppingTableViewCell.swift
//  SettingTableView
//
//  Created by Jisoo Ham on 5/27/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var checkBtn: UIButton!
    @IBOutlet var favBtn: UIButton!
    @IBOutlet var todoLabel: UILabel!
    
    func configureBtn(
        btn: UIButton,
        btnImgName: String
    ) {
        btn.setTitle("", for: .normal)
        btn.setImage(UIImage(systemName: btnImgName), for: .normal)
        btn.tintColor = .black
        btn.imageView?.contentMode = .scaleAspectFit
    }
    
    func configureLabel(
        label: UILabel,
        text: String,
        fontSize: CGFloat,
        fontWeight: UIFont.Weight
    ) {
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: fontWeight)
        label.textAlignment = .left
    }
    
    
}
