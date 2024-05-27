//
//  AdTableViewCell.swift
//  TravelMagazineUIKit
//
//  Created by Jisoo HAM on 5/27/24.
//

import UIKit

class AdTableViewCell: UITableViewCell {
    @IBOutlet var adLabel: UILabel!
    @IBOutlet var literalAdLabel: UILabel!
    
    var color: [UIColor] = [
        .brown,
        .cyan,
        .yellow,
        .orange,
        .purple,
        .systemPink,
        .green,
        .magenta
    ]
    
    override func awakeFromNib() {
        adLabel.textAlignment = .center
        adLabel.numberOfLines = .zero
        adLabel.font = .systemFont(
            ofSize: 17,
            weight: .bold
        )
        literalAdLabel.text = "Ad"
        literalAdLabel.font = .systemFont(
            ofSize: 13,
            weight: .regular
        )
        literalAdLabel.backgroundColor = .white
        literalAdLabel.layer.cornerRadius = 3
    }
    
    func configureData(data: Travel) {
        adLabel.text = data.title
    }
    
}
